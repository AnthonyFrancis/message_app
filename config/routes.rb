Rails.application.routes.draw do

  resources :inboxes, :path => "inbox" do
    resources :conversations do
    
    end    
  end


  

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:show], as: "profile", :path => ""

  root to: "pages#index"
  # get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
