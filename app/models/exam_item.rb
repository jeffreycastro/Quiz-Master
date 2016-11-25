class ExamItem < ApplicationRecord
  belongs_to :exam
  has_many :answers, inverse_of: :exam_item, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  validates_presence_of :question
end
