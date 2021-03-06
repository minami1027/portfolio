class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :category_id, null: false
      t.string :cocktail_name, null: false
      t.string :cocktail_taste, null: false
      t.string :cocktail_color, null: false
      t.string :alcohol_content, null: false
      t.text :cocktail_image_id
      t.text :cocktail_introduction
      t.string :manufacturing_method, null: false
      t.integer :listing_stop, null: false, default: 0

      t.timestamps
    end
  end
end
