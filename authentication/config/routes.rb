Rails::Application.routes.draw do

  devise_for :user, :controllers => { :sessions => 'sessions' }

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :users do
      collection do
        post :update_positions do
          collection do
            get :update_positions
          end
        end
      end
    end
  end

=begin
  resource :session
  match '/users/reset/:reset_code', :to => 'users#reset', :as => 'reset_users'
  resources :users, :only => [:new, :create] do
    collection do
      get :forgot
      get :reset
    end
  end

  match '/login',  :to => 'sessions#new',     :as => 'login'
  match '/logout', :to => 'sessions#destroy', :as => 'logout'
=end
end
