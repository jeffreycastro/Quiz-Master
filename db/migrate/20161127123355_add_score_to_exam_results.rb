class AddScoreToExamResults < ActiveRecord::Migration[5.0]
  def change
  	add_column :exam_results, :score, :decimal, default: 0.0
  end
end
