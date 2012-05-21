class UnitsCourse < ActiveRecord::Base
  belongs_to :unit
  belongs_to :course
  
  #validates :unit, :course, :presence => true
end