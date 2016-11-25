class Answer < ApplicationRecord
  belongs_to :exam_item

  validates_presence_of :content
end
