# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :teams, :controller => :teams do
  resources :backlogs, :controller => :backlogs do
    member do
      get :issues
    end
  end
end
