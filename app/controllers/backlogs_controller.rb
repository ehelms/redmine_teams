class BacklogsController < ApplicationController
  unloadable

  def index
  end

  def new
    @backlog = Backlog.new
  end

  def show
    @backlog = Backlog.find(params[:id])

    respond_to do |format|
      format.html
      format.api
    end
  end

  def create
    @backlog = Backlog.new
    @backlog.safe_attributes = params[:backlog]

    if @backlog.save
      respond_to do |format|
        format.html do
          flash[:notice] = l(:notice_successful_create)
          if params[:continue]
            redirect_to new_backlog_path
          else
            redirect_to backlog_path(@backlog)
          end
        end

        format.api  { render :action => 'show', :status => :created, :location => url_for(:controller => 'backlogs', :action => 'show', :id => @backlog.id) }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.api  { render_validation_errors(@backlog) }
      end
    end
  end

  def issues
    @issues = Backlog.find(params[:id]).issues
    @query = Query.new
  end
end
