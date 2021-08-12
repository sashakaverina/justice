class AddCoordinatesToIncident < ActiveRecord::Migration[6.0]
  def change
    add_column :incidents, :latitude, :float
    add_column :incidents, :longitude, :float
  end
end
