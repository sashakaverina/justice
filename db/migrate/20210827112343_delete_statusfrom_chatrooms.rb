class DeleteStatusfromChatrooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :chatrooms, :status
  end
end
