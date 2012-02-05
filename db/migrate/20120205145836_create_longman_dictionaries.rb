class CreateLongmanDictionaries < ActiveRecord::Migration
  def change
    add_column :expressions, :audio_url, :text
  end
end
