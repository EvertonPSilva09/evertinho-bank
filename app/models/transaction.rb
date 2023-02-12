class Transaction < ApplicationRecord
    enum :category, { debit: 'debit', credit: 'credit' }
end
