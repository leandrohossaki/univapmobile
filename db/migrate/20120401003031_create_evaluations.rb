class CreateEvaluations < ActiveRecord::Migration
  def self.up
    create_table :evaluations do |t|
      t.references :discipline
      t.references :student
      t.column :evaluation1, :float
      t.column :evaluation2, :float
    end
    # execute "ALTER TABLE evaluations ADD PRIMARY KEY (discipline_id, student_id);"
  end
  
  def self.down
    drop_table :evaluations
  end
end
