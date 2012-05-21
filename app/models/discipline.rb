class Discipline < ActiveRecord::Base
  has_many :evaluations
  has_many :students, :through => :evaluations
  
  has_many :lacks
  has_many :students, :through => :lacks
  
  def self.find_student_pending(student_id)
    return Discipline.find(
      :all,
      :joins => "LEFT JOIN (SELECT DISCIPLINE_ID FROM EVALUATIONS WHERE STUDENT_ID = " + student_id.to_s + ") EVALUATIONS ON (EVALUATIONS.DISCIPLINE_ID = DISCIPLINES.ID)",
      :conditions => "DISCIPLINE_ID IS NULL")
  end
end
