module RedmineTeams
  module Concerns
    module IssueExtensions
      extend ActiveSupport::Concern

      included do
        belongs_to :team, -> { joins(:issues_teams) }
      end

    end
  end
end
