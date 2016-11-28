class CreateExamResults < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_results do |t|
      t.integer :exam_id

      t.timestamps
    end
  end
end
