class EvaluationStatus < ActiveRecord::Migration
  def up
    add_column :evaluations, :status, :boolean
  end

  def down
    remove_column :evaluations, :status
  end
end
