json.car do
  json.id @car.id
  json.car_clug @car.slug
  json.max_speed "#{@car.max_speed}km/h"
  json.max_speed_on_track @max_speed_on_track
end
