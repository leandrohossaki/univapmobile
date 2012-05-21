class CreateDisciplines < ActiveRecord::Migration
  def self.up
    create_table :disciplines do |t|
      t.references :course
      t.column :description, :string
    end
  end
  
  def self.down
    drop_table :disciplines
  end
end
