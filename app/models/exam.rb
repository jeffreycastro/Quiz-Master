class Exam < ApplicationRecord
  has_many :exam_items, dependent: :destroy
  accepts_nested_attributes_for :exam_items, allow_destroy: true

  validates_presence_of :name
end
