class CreateLacks < ActiveRecord::Migration
  def self.up
    create_table :lacks do |t|
      t.references :discipline
      t.references :student
      t.column :date, :date
      t.column :num_lacks, :integer
    end
    # execute "ALTER TABLE lacks ADD PRIMARY KEY (discipline_id, student_id, date);"
  end
  
  def self.down
    drop_table :lacks
  end
end
