class Api::V1::CarsController < Api::V1::ApiController
  before_action :car

  def show
    @max_speed_on_track = get_max_speed_on_track
  end

  private

  def car
    @car = Car.friendly.find(params[:id])
  end

  def track
    @track ||= Track.find_by(name: params[:track].downcase)
  end

  def get_max_speed_on_track
    return 'no track selected' if params[:track].blank?
    return "#{track.max_speed_of(car)}km/h" if track
    'track not found'
  end
end