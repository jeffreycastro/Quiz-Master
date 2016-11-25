class AddExamItemIdToAnswers < ActiveRecord::Migration[5.0]
  def change
  	add_column :answers, :exam_item_id, :integer
    add_index :answers, :exam_item_id
  end
end
