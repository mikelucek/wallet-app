class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :cnumber
      t.string :ctype
      t.integer :xmonth
      t.integer :xyear
      t.float :balance

      t.timestamps null: false
    end
  end
end
