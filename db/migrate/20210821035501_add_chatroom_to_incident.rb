class AddChatroomToIncident < ActiveRecord::Migration[6.0]
  def change
    add_reference :incidents, :chatroom, foreign_key: true
  end
end
