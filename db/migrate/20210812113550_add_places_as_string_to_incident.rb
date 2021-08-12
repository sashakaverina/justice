class AddPlacesAsStringToIncident < ActiveRecord::Migration[6.0]
  def change
    add_column :incidents, :place, :string
  end
end
