module RedmineTeams
  module Extensions
    module IssueExtensions
      extend ActiveSupport::Concern

      included do
        has_one :issues_teams
        has_one :team, :through => :issues_teams

        has_one :issues_team_sprints
        has_one :team_sprint, :through => :issues_team_sprints

        after_save :ensure_team_sprint
      end

      def ensure_team_sprint
        return if (self.team_sprint && self.team_sprint.team == self.team)

        self.team_sprint = self.team.backlog
        self.save!
      end

    end
  end
end
