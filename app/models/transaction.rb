class Transaction < ApplicationRecord
    enum :category, { debit: 'debit', credit: 'credit' }

    validates :data, comparison: { less_than_or_equal_to: proc { Date.current } }
    validates :description, presence: true
    validates :description, length: { maximum: 150 }
    validates :value, presence: true
    validates :category, presence: true

    validate :validate_if_exist_balance

    def self.current_balance
    self.credit.sum(:value) - self.debit.sum(:value)
    end

    private

    def validate_if_exist_balance
        return if credit?
        return if value.to_f <= Transaction.current_balance
        
        errors.add :value, "- You don't have enough balance"
    end

end
