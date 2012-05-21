class Unit < ActiveRecord::Base
  has_many :courses_units
  has_many :courses, :through => :courses_units
  
  has_many :books
  has_many :students
end
