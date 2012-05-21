class Location < ActiveRecord::Base  
  belongs_to :book
  belongs_to :student
  
  #validates :book, :student, :presence => true
  
  def self.find_student_leased(student_id)
    return Location.find(:all,
                         :conditions => {:student_id => student_id, :returned => false},
                         :order => "date_location")
  end
  
  def self.find_student_history(student_id)
    return Location.find(:all,
                        :conditions => {:student_id => student_id, :returned => true},
                        :order => "date_location")
  end
end