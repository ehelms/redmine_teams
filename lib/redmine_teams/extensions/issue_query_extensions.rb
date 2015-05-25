require_dependency 'issue_query'

require 'erb'

module RedmineTeams
  module Extensions
    module IssueQueryExtension
      extend ActiveSupport::Concern

      included do
        unloadable # Send unloadable so it will not be unloaded in development

        alias_method_chain :available_filters, :teams_issue_type
        alias_method_chain :available_columns, :teams_issue_type
        #alias_method_chain :sql_for_field, :backlogs_issue_type
        #alias_method_chain :joins_for_order_statement, :backlogs_issue_type
      end

      module ClassMethods
        # Setter for +available_columns+ that isn't provided by the core.
        def available_columns=(v)
          self.available_columns = (v)
        end

        # Method to add a column to the +available_columns+ that isn't provided by the core.
        def add_available_column(column)
          self.available_columns << (column)
        end
      end

     # def joins_for_order_statement_with_backlogs_issue_type(order_options)
     #   joins = joins_for_order_statement_without_backlogs_issue_type(order_options)
     #   if order_options
     #     if order_options.include?("#{RbRelease.table_name}")
     #       joins = "" if joins.nil?
     #       if (Redmine::VERSION::MAJOR > 2) || (Redmine::VERSION::MAJOR == 2 && Redmine::VERSION::MINOR >= 3)
     #         joins += " LEFT OUTER JOIN #{RbRelease.table_name} ON #{RbRelease.table_name}.id = #{queried_table_name}.release_id"
     #       else
     #         joins += " LEFT OUTER JOIN #{RbRelease.table_name} ON #{RbRelease.table_name}.id = #{Issue.table_name}.release_id"
     #       end
     #     end
     #   end

     #   joins
     # end

      def available_filters_with_teams_issue_type
        @available_filters = available_filters_without_teams_issue_type
        return @available_filters if @team_columns_included

        @team_columns_included = true

        teams_filters = {}

        teams_filters['team_id'] = {
          :type => :list_optional,
          :name => 'Team',
          :values => Team.all.collect { |team| [team.name, team.id.to_s] },
          :order => 23
        }

        teams_filters['team_sprint_id'] = {
          :type => :list_optional,
          :name => 'Team Sprint',
          :values => TeamSprint.all.collect { |team| [sprint.name, sprint.id.to_s] },
          :order => 24
        }

        @available_filters = @available_filters.merge(teams_filters)
      end

      def available_columns_with_teams_issue_type
        @available_columns = available_columns_without_teams_issue_type
        return @available_columns if @team_columns_included

        @team_columns_included = true

        @available_columns << QueryColumn.new(:team, :sortable => "#{Team.table_name}.name")
      end

    end
  end
end

unless IssueQuery.included_modules.include? RedmineTeams::Extensions::IssueQueryExtension
  IssueQuery.send(:include, RedmineTeams::Extensions::IssueQueryExtension)
end
