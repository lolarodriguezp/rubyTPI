Rails.application.routes.draw do

  get 'welcome/index'
  get 'welcome/students'
  get 'welcome/evaluations'

  get 'courses/:course_id/evaluations/:id/results', to:'evaluations#results', as: 'results'

  get 'courses/:course_id/summary', to:'courses#summary', as: 'summary'


  root to: 'welcome#index'

  resources :courses do
  	resources :evaluations, except: :show
  	resources :students do
      resources :exams
    end	
  end

  devise_for :professors #, only[:sessions]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
