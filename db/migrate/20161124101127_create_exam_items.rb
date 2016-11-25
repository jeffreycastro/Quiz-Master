class CreateExamItems < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_items do |t|
      t.text :question

      t.timestamps
    end
  end
end
