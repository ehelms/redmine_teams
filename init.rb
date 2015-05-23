require 'redmine'
require 'redmine_teams'

Redmine::Plugin.register :redmine_teams do
  name 'Redmine Teams plugin'
  author 'Eric D Helms'
  description 'This is a plugin for Redmine that provides team support'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  menu :top_menu, :teams, {:controller => :teams, :action => :index}, :caption => 'Teams'
end
