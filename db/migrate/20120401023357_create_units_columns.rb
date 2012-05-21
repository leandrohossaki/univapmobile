class CreateUnitsColumns < ActiveRecord::Migration
  def up
    add_column :units, :name, :string
    add_column :units, :phone, :string, :limit => 15
    add_column :students, :phone, :string, :limit => 15
  end

  def down
    remove_column :units, :name
    remove_column :units, :phone
    remove_column :students, :phone
  end
end
