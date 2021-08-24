class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :incidents, dependent: :destroy
  has_many :accesses, dependent: :destroy
  has_many :chatrooms, through: :sender_id
  has_many :chatrooms, through: :recipient_id
  acts_as_reader

  validates :nickname, presence: true
  has_many :notifications, as: :recipient
end
