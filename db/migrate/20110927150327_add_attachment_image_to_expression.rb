class AddAttachmentImageToExpression < ActiveRecord::Migration
  def self.up
    add_column :expressions, :image_file_name, :string
    add_column :expressions, :image_content_type, :string
    add_column :expressions, :image_file_size, :integer
    add_column :expressions, :image_updated_at, :datetime

    change_column :expressions, :name, :string
  end

  def self.down
    remove_column :expressions, :image_file_name
    remove_column :expressions, :image_content_type
    remove_column :expressions, :image_file_size
    remove_column :expressions, :image_updated_at

    change_column :expressions, :name, :text
  end
end
