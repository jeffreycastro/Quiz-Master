Rails.application.routes.draw do
  resources :exam_items
  resources :exams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'exams#index'
end
