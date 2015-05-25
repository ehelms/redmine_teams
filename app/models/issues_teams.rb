class IssuesTeams < ActiveRecord::Base
  unloadable

  belongs_to :issue
  belongs_to :team

end
