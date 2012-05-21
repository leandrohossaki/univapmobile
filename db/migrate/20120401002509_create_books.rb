class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.references :category
      t.column :name, :string
      t.column :author, :string
      t.column :editor, :string
    end
  end
  
  def self.down
    drop_table :books
  end
end
