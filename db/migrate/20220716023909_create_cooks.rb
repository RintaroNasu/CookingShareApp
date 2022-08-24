class CreateCooks < ActiveRecord::Migration[6.1]
  def change
    create_table :cooks do |t|
      t.string :cooking_name
      t.text :how_to_make
      t.integer :user_id
      t.string :image
      t.integer :easy
      t.integer :deliciousness

      t.timestamps
    end
  end
end
