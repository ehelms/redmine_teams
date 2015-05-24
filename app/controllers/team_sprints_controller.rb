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

    if @team_sprint.save
      respond_to do |format|
        format.html do
          flash[:notice] = l(:notice_successful_create)
          if params[:continue]
            redirect_to new_team_sprint_path
          else
            redirect_to team_sprint_path(@team_sprint)
          end
        end

        format.api  { render :action => 'show', :status => :created, :location => url_for(:controller => 'team_sprints', :action => 'show', :id => @team_sprint.id) }
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
