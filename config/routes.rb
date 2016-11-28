Rails.application.routes.draw do
  resources :exam_result_items do
    member do
      put :submit_answer
      get :next_question
    end
  end

  resources :exam_results do
    collection do
      get :take_exam
    end
  end

  resources :answers

  resources :exam_items

  resources :exams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'exams#index'
end
