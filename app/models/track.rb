class Track < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  before_save :downcase_name
  enum surface_type: [:snow, :gravel, :asphalt]

  def max_speed_of(vehicle)
    (1 - SlowingPercentage.for_surface_type(surface_type)) * vehicle.max_speed
  end

  private

  def downcase_name
    self.name.downcase!
  end
end
