class CreateStudentCourse < ActiveRecord::Migration
  def up
    change_table :students do |t|
      t.references :course
    end
  end

  def down
    remove_column :students, :course_id
  end
end
