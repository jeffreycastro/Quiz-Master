class ExamResultItem < ApplicationRecord
  belongs_to :exam_result
  belongs_to :exam_item

  def check_answer(given_answer)
    exam_item.answers.each do |a|
      accepted_answers = [a.content.strip.downcase]
      accepted_answers << a.content.to_f.to_words if a.content.numeric?

      if accepted_answers.include? given_answer.strip.downcase
        self.update_attribute(:is_correct, true)
        exam_result.update_attribute(:score, exam_result.score + 1)
        return true
      end
    end
    false
  end
end
