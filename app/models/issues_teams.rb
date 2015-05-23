class IssuesTeams < ActiveRecord::Base

  belongs_to :issue
  belongs_to :team

end
