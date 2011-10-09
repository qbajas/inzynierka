class AlterExpressionAddSynonyms < ActiveRecord::Migration

  #def self.up
  #  add_column :expressions, :synonyms, :text
  #  change_column :expressions, :notes, :string
  #end

  def change
    add_column :expressions, :synonyms, :text
    add_column :expressions, :examples, :text
    change_column :expressions, :notes, :string
  end

end
