class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :merchent_name
      t.boolean :debit
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
