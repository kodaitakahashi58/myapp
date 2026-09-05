class CreateTrades < ActiveRecord::Migration[7.2]
  def change
    create_table :trades do |t|
      t.references :user, null: false, foreign_key: true
      t.string :stock_name
      t.string :stock_code
      t.integer :trade_type
      t.integer :shares
      t.decimal :price
      t.date :traded_on
      t.text :reason

      t.timestamps
    end
  end
end
