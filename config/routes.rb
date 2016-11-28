Rails.application.routes.draw do
  resources :exam_result_items, except: [:index, :show, :new, :edit, :create, :update, :destroy] do
    member do
      put :submit_answer
      get :next_question
    end
  end

  resources :exam_results, except: [:index, :show, :new, :edit, :create, :update, :destroy] do
    collection do
      get :take_exam
    end
  end

  resources :exams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'exams#index'
end
