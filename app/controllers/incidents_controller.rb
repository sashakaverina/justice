class IncidentsController < ApplicationController
  before_action :set_incident, only: :show
  def index
  end

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

  private

  def set_incident
    @incident = Incident.find(params[:id])
  end

  def incident_params
    params.require(:incident).permit(:title, :description, :date)
  end

end
