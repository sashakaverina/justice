class Chatroom < ApplicationRecord

  enum status: [:created, :pending, :accepted, :rejected]

  has_noticed_notifications
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, scope: :recipient_id
  scope :between, -> (sender_id, recipient_id) do
    where("(chatroom.sender_id = ? AND chatroom.recipient_id =?) OR (chatroom.sender_id = ? AND chatroom.recipient_id =?)", sender_id, recipient_id, recipient_id, sender_id)
  end

  def pending?
    status == 'pending'
  end

  def mark_as_accepted!
    status = "accepted"
  end

end
