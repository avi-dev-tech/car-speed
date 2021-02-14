class SlowingPercentage
  SLOWING_FACTOR = {
    snow: 30,
    gravel: 10,
    asphalt: 20
  }.freeze

  def self.for_surface_type(type)
    SLOWING_FACTOR[type.to_sym].to_f / 100
  end
end