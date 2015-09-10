class CreateDrinksTable < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.date :date
      t.integer :quantity
      t.string :drink_type
      t.string :location
    end
  end
end
