class EvaluationPeriod < ActiveRecord::Migration
  def up
    change_table :evaluations do |t|
      t.column :period, :integer
    end
  end

  def down
    remove_column :evaluations, :period
  end
end
