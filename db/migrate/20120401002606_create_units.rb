class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.column :description, :string
      t.column :address, :string
    end
  end
  
  def self.down
    drop_table :units
  end
end
