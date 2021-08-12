class RemovePlacesFromIncidents < ActiveRecord::Migration[6.0]
  def change
    remove_column :incidents, :place, :string
  end
end
