class BookUnitId < ActiveRecord::Migration
  def up
    change_table :books do |t|
      t.references :unit
    end
  end

  def down
    remove_column :books, :unit_id
  end
end
