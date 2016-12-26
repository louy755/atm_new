Rails.application.routes.draw do
  resources :atm_maches 
    resources :accounts,only: [:new,]
    resources :transactions
    resources :user_infos
     devise_for :users
      root 'atm_maches#index'
    resources :accounts do
      member do
        get :transaction_list
        get :select_transaction
        get :new_deposit
        post :create_deposit
        get :new_withdrawal
        post :create_withdrawal
      end
    end
        get 'page/home'
  
end
