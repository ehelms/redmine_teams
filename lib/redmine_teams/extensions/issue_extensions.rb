require_dependency 'issue'

module RedmineTeams
  module Extensions
    module IssueExtensions
      extend ActiveSupport::Concern

      included do
        unloadable

        has_one :issues_teams, :inverse_of => :issue
        has_one :team, :through => :issues_teams
        accepts_nested_attributes_for :team

        has_one :issues_team_sprints
        has_one :team_sprint, :through => :issues_team_sprints

        after_save :ensure_team_sprint
      end

      def ensure_team_sprint
        return if (self.team_sprint && self.team_sprint.team == self.team)

        self.team_sprint = self.team.backlog
        self.save!
      end

      def team_id
        issues_teams.team_id
      end

    end
  end
end

unless Issue.included_modules.include?(RedmineTeams::Extensions::IssueExtensions)
  Issue.send(:include, RedmineTeams::Extensions::IssueExtensions)
end
