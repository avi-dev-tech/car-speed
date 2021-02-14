class Car < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged
  validates :max_speed, presence: true
end
