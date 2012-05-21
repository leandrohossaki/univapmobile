class CreateUnitsCourses < ActiveRecord::Migration
  def self.up
    create_table :units_courses do |t|
      t.references :unit
      t.references :course
    end
  end
  
  def self.down
    drop_table :units_courses
  end
end
