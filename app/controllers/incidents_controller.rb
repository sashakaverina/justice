class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :share, :report]

  def show
    authorize @incident
    @user = User.new
  end

  def new
    @incident = Incident.new
    authorize @incident
  end

  def create
    @incident = Incident.new(incident_params)
    @user = current_user
    @incident.user = @user
    authorize @incident
    if @incident.save
      redirect_to incident_path(@incident)
    else
      render 'new'
    end
  end

  def share
    authorize @incident
    # check if user already exists; if so, use that user, if not, create user
    @user = User.new(user_params)
    @user.nickname = @user.email
    if @user.save
      # To-DO - send email to trusted contact & associate with access
      @access = Access.new
      @access.user = @user
      @access.incident = @incident
      @access.save!
      redirect_to incident_path(@incident)
    end
  end

  #share_many

  def report
    # @jp = GoogleTranslate.translate(@incident)
    authorize @incident
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Incident No. #{@incident.id}",
        page_size: "A4",
        encoding: 'UTF-8',
        :disable_smart_shrinking => true,
        template: "incidents/report.html.erb",
        layout: "pdf.html",
        orientation: 'Portrait',
        lowquality: true,
        print_media_type: true,
        dpi: 75,
        viewport_size: '1280x1024',
        disposition: 'attachment'
      end
    end
  end

  private

  def set_incident
    @incident = Incident.find(params[:id])
  end

  def incident_params
    params.require(:incident).permit(:title, :description, :attachment, :date, :place, :tag_list)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
