class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.references :book
      t.references :student
      t.column :date_location, :date
      t.column :date_devolution, :date
      t.column :returned, :boolean
    end
    # execute "ALTER TABLE locations ADD PRIMARY KEY (book_id, student_id);"
  end
  
  def self.down
    drop_table :locations
  end
end
