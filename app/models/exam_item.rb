class ExamItem < ApplicationRecord
  belongs_to :exam
  has_many :answers, inverse_of: :exam_item, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  validates_presence_of :question

  before_create :set_sequence_number

  def set_sequence_number
    last_sequence_number = self.exam.exam_items.map{ |x| x.seq_num }.max.to_i
    self.seq_num = last_sequence_number + 1
  end
end
