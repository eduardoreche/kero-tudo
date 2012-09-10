class CreateProductsTagsJoin < ActiveRecord::Migration
  def up
    create_table 'products_tags', id: false do |t|
      t.references :product
      t.references :tag
    end
    add_index 'products_tags', :product_id
    add_index 'products_tags', :tag_id
  end

  def down
    drop_table 'products_tags'
  end
end
