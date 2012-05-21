class StudentUnitId < ActiveRecord::Migration
  def up
    change_table :students do |t|
      t.references :unit
    end
  end

  def down
    remove_column :students, :unit_id
  end
end
