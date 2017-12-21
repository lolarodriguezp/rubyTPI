Rails.application.routes.draw do
  #resources :exams
  
  #resources :students

  #resources :evaluations
  root to: 'courses#index'

  resources :courses do
  	resources :evaluations
  	resources :students do 
  		resources :exams
	end  	
  end

  devise_for :professors #, only[:sessions]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
