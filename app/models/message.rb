class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  acts_as_readable on: :created_at

  validates :content, presence: true
end
