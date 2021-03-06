class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true
  belongs_to :chatroom, optional: true
end
