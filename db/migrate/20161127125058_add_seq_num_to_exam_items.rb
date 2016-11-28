class AddSeqNumToExamItems < ActiveRecord::Migration[5.0]
  def change
    add_column :exam_items, :seq_num, :integer
  end
end
