class Initial < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :drink_type
      t.string :cups

      t.timestamps
    end
  end
end
