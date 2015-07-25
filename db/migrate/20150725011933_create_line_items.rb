class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      # will have a product, the product (calling product_id), SAME AS REFERENCES
      t.references :product, index: true, foreign_key: true
      # will belong to cart (by convention cart_id)
      t.belongs_to :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
