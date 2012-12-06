Supertramp::Application.routes.draw do
  
  authenticated :user do
    root :to => 'themes#index'
  end


  resources :themes do
    resources :categories do
      match 'themes/:theme_id/cards/:id' => 'cards#update', :via => :put, :as => :update_theme_cards
    end

    resources :cards do
      match 'themes/:theme_id/cards/:id' => 'cards#update', :via => :put, :as => :update_theme_cards
      resources :content do
        match 'themes/:theme_id/cards/card_id/contents/:id' => 'contents#update', :via => :put, :as => :update_theme_card_contents
end

    end

    
    
    
  devise_scope :user do
    root :to => "devise/registrations#new"
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :registrations => "registrations", :confirmations => "confirmations" }
  match 'users/bulk_invite/:quantity' => 'users#bulk_invite', :via => :get, :as => :bulk_invite
  resources :users, :only => [:show, :index] do
    get 'invite', :on => :member
  end
end