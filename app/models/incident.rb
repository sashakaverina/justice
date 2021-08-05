class Incident < ApplicationRecord
  has_many :accesses
  has_many :tags
  belongs_to :antagonizer
  belongs_to :collection
  belongs_to :place
  belongs_to :user

  validates :description, presence: true
  

end
