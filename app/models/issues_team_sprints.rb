class IssuesTeamSprints < ActiveRecord::Base

  belongs_to :issue
  belongs_to :team_sprint

end
