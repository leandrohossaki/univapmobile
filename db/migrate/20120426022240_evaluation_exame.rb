class EvaluationExame < ActiveRecord::Migration
  def up
    add_column :evaluations, :exame, :float
  end

  def down
    remove_column :evaluations, :exame
  end
end
