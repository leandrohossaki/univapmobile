class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.column :name, :string
      t.column :birth, :date
      t.column :rg, :string, :limit => 13
      t.column :cpf, :string, :limit => 14
      t.column :address, :string
    end
  end
  
  def self.down
    drop_table :students
  end
end
