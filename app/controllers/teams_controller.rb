class TeamsController < ApplicationController
  unloadable

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html
      format.api
    end
  end

  def create
    @team = Team.new
    @team.safe_attributes = params[:team]

    if @team.save
      respond_to do |format|
        format.html do
          flash[:notice] = l(:notice_successful_create)
          if params[:continue]
            redirect_to new_team_path
          else
            redirect_to team_path(@team)
          end
        end

        format.api  { render :action => 'show', :status => :created, :location => url_for(:controller => 'teams', :action => 'show', :id => @team.id) }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.api  { render_validation_errors(@team) }
      end
    end
  end

end
