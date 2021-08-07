class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :report]

  def show
    @jp = GoogleTranslate.translate(@incident)
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
        render pdf: "#{@jp}",
        page_size: 'A4',
        # template: "trips/report.html.erb",
        layout: "pdf.html",
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  private

  def set_incident
    @incident = Incident.find(params[:id])
  end

  def incident_params
    params.require(:incident).permit(:title, :description, :date)
  end

end
