class CreateExamResultItems < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_result_items do |t|
      t.integer     "exam_result_id"
      t.integer     "exam_item_id"
      t.integer     "seq_num"
      t.text        "answer"
      t.boolean     "is_correct",     default: false
      t.datetime    "created_at",     null: false
      t.datetime    "updated_at",     null: false
      t.timestamps
    end
  end
end
