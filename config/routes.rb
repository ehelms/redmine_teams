# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :teams, :controller => :teams do
  resources :team_sprints, :controller => :team_sprints do
    member do
      get :issues
    end
  end
end
