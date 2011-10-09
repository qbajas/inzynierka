class CreateCollections < ActiveRecord::Migration

  def change
    create_table :collections do |t|
      t.string :name
      t.integer :user_id
      t.text :description
      t.timestamps
    end
    add_column :expressions, :collection_id, :integer
  end
end
