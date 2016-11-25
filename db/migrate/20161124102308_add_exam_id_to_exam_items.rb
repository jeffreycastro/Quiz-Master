class AddExamIdToExamItems < ActiveRecord::Migration[5.0]
  def change
    add_column :exam_items, :exam_id, :integer
    add_index :exam_items, :exam_id
  end
end
