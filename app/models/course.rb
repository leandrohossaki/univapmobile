class Course < ActiveRecord::Base
  has_many :students
  
  has_many :courses_units
  has_many :units, :through => :courses_units
end
