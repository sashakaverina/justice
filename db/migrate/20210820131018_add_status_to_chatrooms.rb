class AddStatusToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :status, :integer
  end
end
