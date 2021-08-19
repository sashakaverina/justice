class Antagonizer < ApplicationRecord
  has_many :incidents
  has_many_attached :photos
end
