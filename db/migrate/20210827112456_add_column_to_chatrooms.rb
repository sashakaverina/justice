class AddColumnToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :status, :integer, default: 0
  end
end
