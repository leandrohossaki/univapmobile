class Evaluation < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :student
  
  def self.find_student_history_approved(student_id)
    #return Evaluation.find(
    #  :all,
    #  :joins => "LEFT JOIN (SELECT DISCIPLINE_ID, STUDENT_ID, SUM(NUM_LACKS) AS num_lacks FROM LACKS GROUP BY DISCIPLINE_ID, STUDENT_ID) LACKS ON (EVALUATIONS.DISCIPLINE_ID = LACKS.DISCIPLINE_ID AND EVALUATIONS.STUDENT_ID = LACKS.STUDENT_ID)",
    #  :conditions => ['EVALUATIONS.STUDENT_ID = ? AND STATUS = 0 AND (((EVALUATION1 + EVALUATION2)/2 >= 5 AND EXAME IS NULL) OR ((EVALUATION1 + EVALUATION2 + EXAME)/3 AND NOT EXAME IS NULL)) AND (LACKS.NUM_LACKS <= 15 OR LACKS.NUM_LACKS IS NULL)', student_id])
    return Evaluation.find_by_sql(["SELECT * 
      FROM EVALUATIONS 
      LEFT JOIN (SELECT DISCIPLINE_ID, STUDENT_ID, SUM(NUM_LACKS) AS num_lacks FROM LACKS GROUP BY DISCIPLINE_ID, STUDENT_ID) LACKS 
      ON (EVALUATIONS.DISCIPLINE_ID = LACKS.DISCIPLINE_ID AND EVALUATIONS.STUDENT_ID = LACKS.STUDENT_ID) 
      WHERE EVALUATIONS.STUDENT_ID = ? AND STATUS = 0 AND (EVALUATION1 + EVALUATION2)/2 >= 5 AND (LACKS.NUM_LACKS <= 15 OR LACKS.NUM_LACKS IS NULL);", student_id])
  end
  
  def self.find_student_history_repproved(student_id)
    #return Evaluation.find(
    #  :all,
    #  :joins => "LEFT JOIN (SELECT DISCIPLINE_ID, STUDENT_ID, SUM(NUM_LACKS) AS NUM_LACKS FROM LACKS GROUP BY DISCIPLINE_ID, STUDENT_ID) LACKS ON (EVALUATIONS.DISCIPLINE_ID = LACKS.DISCIPLINE_ID AND EVALUATIONS.STUDENT_ID = LACKS.STUDENT_ID) ",
    #  :conditions => ['EVALUATIONS.STUDENT_ID = ? AND STATUS = 0 AND ((EVALUATION1 + EVALUATION2 + EXAME)/3 < 5 OR LACKS.NUM_LACKS > 15)', student_id])
    return Evaluation.find_by_sql(["SELECT * 
      FROM EVALUATIONS 
      LEFT JOIN (SELECT DISCIPLINE_ID, STUDENT_ID, SUM(NUM_LACKS) AS num_lacks FROM LACKS GROUP BY DISCIPLINE_ID, STUDENT_ID) LACKS 
      ON (EVALUATIONS.DISCIPLINE_ID = LACKS.DISCIPLINE_ID AND EVALUATIONS.STUDENT_ID = LACKS.STUDENT_ID) 
      WHERE EVALUATIONS.STUDENT_ID = ? AND STATUS = 0 AND (EVALUATION1 + EVALUATION2)/2 < 5 OR LACKS.NUM_LACKS > 15;", student_id])
  end
  
  def self.find_student_now(student_id)
    #return Evaluation.find_all_by_student_id_and_status(student_id, true)
    return Evaluation.find_by_sql(["SELECT * 
      FROM EVALUATIONS 
      LEFT JOIN (SELECT DISCIPLINE_ID, STUDENT_ID, SUM(NUM_LACKS) AS num_lacks FROM LACKS GROUP BY DISCIPLINE_ID, STUDENT_ID) LACKS 
      ON (EVALUATIONS.DISCIPLINE_ID = LACKS.DISCIPLINE_ID AND EVALUATIONS.STUDENT_ID = LACKS.STUDENT_ID) 
      WHERE EVALUATIONS.STUDENT_ID = ? AND STATUS = 1;", student_id])
  end
  
  def self.find_discipline_id_and_student_id(discipline_id, student_id)
    return Evaluation.find(
      :all,
      :conditions => ["discipline_id = ? and student_id = ?", discipline_id, student_id])
  end
end
