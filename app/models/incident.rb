class Incident < ApplicationRecord
  has_many :accesses
  has_many :tags
  belongs_to :antagonizer, optional: true
  belongs_to :collection, optional: true
  belongs_to :user

  validates :description, presence: true

  has_one_attached :attachment

  acts_as_taggable_on :tags
  geocoded_by :place
  after_validation :geocode, if: :will_save_change_to_place?

end
