class Chatroom < ApplicationRecord

  enum status: [:accepted, :pending, :rejected]
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, scope: :recipient_id
  scope :between, -> (sender_id, recipient_id) do
    where("(chatrooms.sender_id = ? AND chatrooms.recipient_id =?) OR (chatrooms.sender_id = ? AND chatrooms.recipient_id =?)", sender_id, recipient_id, recipient_id, sender_id)
  end
  def pending?
    status == 'pending'
  end

  def accepted?
    if status = "accepted"
      Message.create(content: "Your chat request has been accepted. Now you can send messages to each other")
    end
  end

end
