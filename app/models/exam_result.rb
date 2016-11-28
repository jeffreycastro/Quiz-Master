class ExamResult < ApplicationRecord
  belongs_to :exam
  has_many :exam_result_items, inverse_of: :exam_result, dependent: :destroy

  def create_exam_result_items
    exam.exam_items.each do |exam_item|
      ExamResultItem.create(exam_result_id: id, exam_item_id: exam_item.id, seq_num: (exam_item.seq_num), answer: "")
    end
  end

  def total_score
    exam_result_items.count.to_i
  end
end
