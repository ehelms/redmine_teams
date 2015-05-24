require 'redmine_teams/hooks/views_issues_hook'
require 'redmine_teams/hooks/controller_issues_hook'
require 'redmine_teams/extensions/issue_extensions'
require_dependency 'issue'


unless Issue.included_modules.include?(RedmineTeams::Extensions::IssueExtensions)
  Issue.send(:include, RedmineTeams::Extensions::IssueExtensions)
end
