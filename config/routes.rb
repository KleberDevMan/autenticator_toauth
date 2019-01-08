Rails.application.routes.draw do
  get 'index/teste'
  post 'index/questions', to: 'index#questions', as: 'sign_up'
  get 'index/questions', to: 'index#questions', as: 'questions'
  post 'index/result', to: 'index#result', as: 'result'
  get 'index/index', to: 'index#index', as: 'index'

  root to: 'index#index'
end
