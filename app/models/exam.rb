class Exam < ApplicationRecord
  has_many :exam_results, inverse_of: :exam
  has_many :exam_items, inverse_of: :exam, dependent: :destroy
  accepts_nested_attributes_for :exam_items, allow_destroy: true

  validates_presence_of :name
end
