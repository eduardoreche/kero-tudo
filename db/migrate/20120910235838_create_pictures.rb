class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :description
      t.references :product

      t.timestamps
    end
    add_index :pictures, :product_id
  end
end
