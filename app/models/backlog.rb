class Backlog < ActiveRecord::Base
  include Redmine::SafeAttributes

  safe_attributes 'name'

  belongs_to :team
  has_and_belongs_to_many :issues

end
