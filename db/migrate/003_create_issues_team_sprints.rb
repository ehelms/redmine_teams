class CreateIssuesTeamSprints < ActiveRecord::Migration
  def change
    create_table :issues_team_sprints, :id => false do |t|
      t.belongs_to :team_sprint, :index => true
      t.belongs_to :issue, :index => true
    end
  end
end
