module TeamsHelper

  def page_header_title
    link_to("Teams", url_for(:controller => 'teams', :action => 'index'))
  end

end
