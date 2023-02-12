class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.date :data
      t.string :description, limit: 150
      t.integer :value
      t.string :category, limit: 50

      t.timestamps
    end
  end
end
