class ExamItem < ApplicationRecord
  belongs_to :exam

  validates_presence_of :question
end
