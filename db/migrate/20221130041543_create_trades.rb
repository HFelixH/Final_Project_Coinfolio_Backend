class CreateTrades < ActiveRecord::Migration[6.1]
  def change
    create_table :trades do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :symbol
      t.float :price
      t.integer :quantity
      t.float :total
      t.string :type
      t.string :date

      t.timestamps
    end
  end
end
