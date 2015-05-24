class CreateIssuesTeams < ActiveRecord::Migration
  def change
    create_table :issues_teams do |t|
      t.belongs_to :team, :index => true
      t.belongs_to :issue, :index => true
    end
  end
end
