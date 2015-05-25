class Team < ActiveRecord::Base
  unloadable

  include Redmine::SafeAttributes

  safe_attributes 'name'

  has_many :team_sprints, :inverse_of => :team
  has_and_belongs_to_many :issues

  validates_presence_of :name
  validates_uniqueness_of :name

  after_save :add_team_backlog

  def add_team_backlog
    return if backlog
    TeamSprint.create(:name => "Backlog", :team => self, :backlog => true)
  end

  def backlog
    team_sprints.where(:backlog => true).first
  end

  def to_s
    name
  end

end
