class CreateNeverMelts < ActiveRecord::Migration
  def change
    create_table :never_melts do |t|
      t.string :pname
      t.string :descrip
      t.string :flavor
      t.string :scoops
      t.decimal :price
      t.integer :stock
      t.string :image

      t.timestamps
    end
  end
end
