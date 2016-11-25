module ExamItemHelper
	def possible_answers_display(exam_item)
    exam_item.answers.pluck(:content).join('<br/>')
  end
end
