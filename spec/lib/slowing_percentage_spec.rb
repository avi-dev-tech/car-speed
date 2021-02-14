require 'rails_helper'
RSpec.describe SlowingPercentage do
  describe 'for_surface_type' do
    {snow: 0.3, gravel: 0.1, asphalt: 0.2}.each do |key, value|
      it "should return #{value} for type #{key}" do
        expect(SlowingPercentage.for_surface_type(key)).to eq(value)
      end
    end
  end
end