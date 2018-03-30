class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.timestamps null: false
      t.string :owner
      t.string :location
      t.string :type
      t.string :room
    end
  end
end
