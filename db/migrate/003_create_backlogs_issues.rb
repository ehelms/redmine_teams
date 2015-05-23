class CreateBacklogsIssues < ActiveRecord::Migration
  def change
    create_table :backlogs_issues, :id => false do |t|
      t.belongs_to :backlog, :index => true
      t.belongs_to :issue, :index => true
    end
  end
end
