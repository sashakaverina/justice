class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :share, :report, :edit, :update]

  def show
    @user = User.new
    unless @incident.antagonizer.nil?
      @match = Incident.where(antagonizer: @incident.antagonizer).where.not(user: current_user).take

      if @match
        if Chatroom.between(current_user.id, @match.user.id).present?
          @chatroom = Chatroom.between(current_user.id, @match.user.id).first
        else
          @chatroom = Chatroom.create!(sender_id: current_user.id, recipient_id: @match.user.id)
          flash[:match_alert]
        end
      end
    end
  end

  def new
    @incident = Incident.new
    @incident.build_antagonizer
    authorize @incident
  end

  def create
    @incident = Incident.new(incident_params)
    @user = current_user
    @incident.user = @user

    authorize @incident
    if @incident.save
      if @incident.antagonizer
        @id = FacesFinding.new(@incident.antagonizer).call
        if @id
          @incident.antagonizer_id = @id
          @incident.save
        end
      end
      redirect_to incident_path(@incident)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @incidnet = Incident.find(params[:id])
    authorize @incident
    # if incident does not have an antagonizer
    if @incident.antagonizer.nil?
      # check if antagonizer feature matches other antagonizer
      @matching_id = FacesFinding.new(@incident.antagonizer).call
      if @matching_id.nil?
        # if does not match create an antagonizer
        @antagonizer = Antagonizer.new(photos: params[:antagonizer_photos])
        @antagonizer.save
      else
        @antagonizer = Antagonizer.find(@matching_id)
      end
      # add the antagonizer to the incident
      @incident.antagonizer = @antagonizer
      @incident.save
    else
      # if incident has an antagonizer
      @incident.antagonizer.update(photos: params[:antagonizer_photos])
    end
    if @incident.update(incident_params)
      redirect_to incident_path(@incident)
      flash[:notice] = "This incident has been updated."
    else
      render "new"
      flash[:notice] = "This incident could not be updated."
    end
  end

  def share
    # check if user already exists; if so, use that user, if not, create user
    @user = User.find_or_initialize_by(email: user_params[:email])
    @user.password ||= user_params[:password]
    @user.nickname = @user.email
    if @user.save
      # To-DO - send email to trusted contact & associate with access
      @access = Access.new
      @access.user = @user
      @access.incident = @incident
      @access.save!
      UserMailer.share(@user).deliver
      flash[:notice] = "Shared to #{@access.user.email}."
      redirect_to incident_path(@incident)
    end
  end

  def share_many

    @incident_ids = JSON.parse(params[:incident_ids])
    @user = User.find_or_initialize_by(email: user_params[:email])
    @user.password ||= user_params[:password]
    @user.nickname = @user.email
    @accesses = []

    if @user.save
      @incident_ids.each do |incident_id|
        @incident = Incident.find(incident_id)
        authorize @incident
        @access = Access.new
        @access.user = @user
        @access.incident = @incident
        @accesses << @access
        @access.save!
        UserMailer.share(@user).deliver
      end
      redirect_to my_incidents_path
      flash[:notice] = "Shared #{@accesses.count} incidents to #{@access.user.email}."
    end
  end


  def report
    @jp = GoogleTranslate.translate(@incident)
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
    authorize @incident
  end

  def incident_params
    params.require(:incident).permit(:title, :description, :attachment, :date, :place, :tag_list)
  end

  def user_params
    params.require(:user).permit(:email, :password, :urls)
  end
end
