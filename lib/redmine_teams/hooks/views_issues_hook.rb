module RedmineIssueBacklogs
  module Hooks
    class ViewsIssuesHook < Redmine::Hook::ViewListener
      render_on :view_issues_show_description_bottom, :partial => "issues/team"
      render_on :view_issues_form_details_bottom, :partial => "issues/team_form"
    end
  end
end
