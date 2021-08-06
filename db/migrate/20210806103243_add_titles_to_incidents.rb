class AddTitlesToIncidents < ActiveRecord::Migration[6.0]
  def change
    add_column :incidents, :title, :string
  end
end
