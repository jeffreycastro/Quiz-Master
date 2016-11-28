class AddIndexToExamResultItems < ActiveRecord::Migration[5.0]
  def change
  	add_index :exam_result_items, :exam_result_id
  	add_index :exam_result_items, :exam_item_id
  end
end
