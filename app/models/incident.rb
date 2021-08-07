class Incident < ApplicationRecord
  has_many :accesses
  has_many :tags
  belongs_to :antagonizer, optional: true
  belongs_to :collection, optional: true
  belongs_to :place, optional: true
  belongs_to :user

  validates :description, presence: true

  has_one_attached :attachment
end
