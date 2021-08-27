class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :incidents, dependent: :destroy
  has_many :accesses, dependent: :destroy
  has_many :chatrooms_as_sender, through: :sender_id, source: :chatrooms
  has_many :chatrooms_as_recipient, through: :recipient_id, source: :chatrooms
  acts_as_reader

  validates :nickname, presence: true
  has_many :notifications, as: :recipient
end
