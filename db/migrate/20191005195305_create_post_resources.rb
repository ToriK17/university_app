class CreatePostResources < ActiveRecord::Migration[6.0]
  def change
    create_table :post_resources do |t|
      t.integer :resource_id
      t.integer :post_id
      t.text :resource_details

      t.timestamps
    end
  end
end
