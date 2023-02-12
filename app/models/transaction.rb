class Transaction < ApplicationRecord
    enum :category, { debit: 'debit', credit: 'credit' }

    def self.current_balance
    self.credit.sum(:value) - self.debit.sum(:value)
    end
end
