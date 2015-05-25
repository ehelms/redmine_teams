class IssuesTeamSprints < ActiveRecord::Base
  unloadable

  belongs_to :issue
  belongs_to :team_sprint

end
