class TeamSprintsController < ApplicationController
  unloadable

  def index
    @team_sprints = Team.find(params[:team_id]).team_sprints
    respond_to do |format|
      format.html { render(:template => 'team_sprints/index', :layout => !request.xhr?) }
      format.api  { }
    end
  end

  def new
    @team = Team.find(params[:team_id])
    @team_sprint = TeamSprint.new
  end

  def show
    @team_sprint = TeamSprint.find(params[:id])

    respond_to do |format|
      format.html
      format.api
    end
  end

  def create
    @team_sprint = TeamSprint.new
    @team_sprint.safe_attributes = params[:team_sprint]
    @team_sprint.team = Team.find(params[:team_id])

    if @team_sprint.save
      respond_to do |format|
        format.html do
          flash[:notice] = l(:notice_successful_create)
          if params[:continue]
            redirect_to new_team_team_sprint_path(@team)
          else
            redirect_to team_team_sprint_path(:team_id => @team_sprint.team.id, :id => @team_sprint.id)
          end
        end

        format.api  { render :action => 'show', :status => :created, :location => url_for(:controller => 'team_sprints', :action => 'show', :team_id => @team_sprint.team, :id => @team_sprint.id) }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.api  { render_validation_errors(@team_sprint) }
      end
    end
  end

  def issues
    @issues = TeamSprint.find(params[:id]).issues
    @query = Query.new
  end
end
