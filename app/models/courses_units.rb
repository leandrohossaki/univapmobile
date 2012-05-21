class CoursesUnits < ActiveRecord::Base
  belongs_to :course
  belongs_to :unit
end
