class Team < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes 'name'

  has_one :backlog
  has_and_belongs_to_many :issues

  validates_presence_of :name
  validates_uniqueness_of :name

  after_save :add_team_backlog

  def add_team_backlog
    Backlog.create(:name => 'Team Backlog', :team => self)
  end

end
