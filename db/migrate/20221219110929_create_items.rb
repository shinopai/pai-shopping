class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :item_image, null: false, default: 'img_item.webp'
      t.integer :quantity, null: false
      t.references :sub_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
