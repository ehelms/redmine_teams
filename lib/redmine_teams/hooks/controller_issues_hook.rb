module RedmineTeams
  module Hooks
    class ControllerIssueHook < Redmine::Hook::ViewListener

      def controller_issues_edit_before_save(context={})
        #if User.current.allowed_to?(:edit_checklists, context[:issue].project)
          save_team_to_issue(context)
        #end
      end

      def controller_issues_new_before_save(context={})
        #if User.current.allowed_to?(:edit_checklists, context[:issue].project)
          save_team_to_issue(context)
        #end
      end

      def save_team_to_issue(context)
        issue = context[:issue]
        team_id = context[:params] && context[:params][:issue][:team]
        team_sprint_id = context[:params] && context[:params][:issue][:team_sprint]
        issue.team = Team.find(team_id) if issue && team_id
        issue.team_sprint = TeamSprint.find(team_sprint_id) if issue && team_sprint_id
      end

    end
  end
end
