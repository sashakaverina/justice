class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :avatar, :string
    add_column :users, :victim, :boolean, default: true
  end
end
