# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :teams, :controller => :teams do
  resources :team_sprints, :controller => :team_sprints do
    resources :issues, :only => [:index] do
    end
  end
end
