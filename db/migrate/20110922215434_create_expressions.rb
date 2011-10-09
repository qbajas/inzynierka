class CreateExpressions < ActiveRecord::Migration
  def change
    create_table :expressions do |t|
      t.text :name
      t.text :definition
      t.text :notes

      t.timestamps
    end
  end
end
