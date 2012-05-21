class CreateSenha < ActiveRecord::Migration
  def up
    add_column :students, :password, :string, :limit => 10
  end

  def down
    remove_column :students, :password
  end
end