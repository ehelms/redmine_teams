module RedmineTeams
  module Extensions
    module IssueExtensions
      extend ActiveSupport::Concern

      included do
        has_one :issues_teams
        has_one :team, :through => :issues_teams
      end

    end
  end
end
