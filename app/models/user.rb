class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :incidents, dependent: :destroy
  has_many :accesses, dependent: :destroy
  acts_as_reader

  validates :nickname, presence: true
end
