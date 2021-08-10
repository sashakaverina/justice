class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :report]

  def show
  end

  def new
    @incident = Incident.new
  end

  def create
    @incident = Incident.new(incident_params)
    @user = current_user
    @incident.user = @user
    if @incident.save
      redirect_to incident_path(@incident)
    else
      render 'new'
    end
  end

  def report
    @jp = GoogleTranslate.translate(@incident)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Incident No. #{@incident.id}",
        page_size: "Letter",
        encoding: 'UTF-8',
        template: "incidents/report.html.erb",
        layout: "pdf.html",
        orientation: 'Portrait',
        lowquality: true,
        print_media_type: true,
        dpi: 75,
        disposition: 'attachment'
      end
    end
  end

  private

  def set_incident
    @incident = Incident.find(params[:id])
  end

  def incident_params
    params.require(:incident).permit(:title, :description, :attachment, :date)
  end

end
