class AddExamIdIndexToExamResults < ActiveRecord::Migration[5.0]
  def change
    add_index :exam_results, :exam_id
  end
end
