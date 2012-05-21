class Student < ActiveRecord::Base
  belongs_to :course
  belongs_to :unit
  
  has_many :evaluations
  has_many :disciplines, :through => :evaluations
  
  has_many :locations
  has_many :books, :through => :locations
  
  has_many :lacks
  has_many :disciplines, :through => :lacks
  
  validates :course, :presence => true
end
