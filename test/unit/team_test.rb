require File.expand_path('../../test_helper', __FILE__)

class TeamTest < ActiveSupport::TestCase
  fixtures :projects, :enumerations, :issue_statuses, :issues, :trackers, :users, :issue_categories, :trackers

  def setup
    @team = Team.create(:name => 'Core Team')
  end

  # Replace this with your real tests.
  def test_team
    assert @team
  end

  def test_add_issue
    issue = Issue.first
    issue.team = @team

    assert issue.save!
    assert_equal Issue.find(issue.id).team, @team
  end

end
