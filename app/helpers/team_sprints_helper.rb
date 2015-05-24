module TeamSprintsHelper

  def page_header_title
    if @team
      link_to("Teams", url_for(:controller => 'teams', :action => 'index')) + ' >> ' + link_to(@team.name, url_for(:controller => "teams", :action => 'show', :id => @team.id))
    else
      link_to("Teams", url_for(:controller => 'teams', :action => 'index'))
    end
  end

end
