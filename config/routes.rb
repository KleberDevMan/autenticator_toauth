Rails.application.routes.draw do
  get 'index/index'
  post 'index/sign_up', to: 'index#sign_up', as: 'sign_up'
  get 'index/questions', to: 'index#questions', as: 'questions'

  root to: 'index#index'
end
