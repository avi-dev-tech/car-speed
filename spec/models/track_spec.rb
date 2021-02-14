require 'rails_helper'

RSpec.describe Track, type: :model do
  describe 'schema' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:surface_type).of_type(:datetime) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { should define_enum_for(:surface_type).with_values([:snow, :gravel, :asphalt]) }
  end

  describe 'downcase_name' do
    it 'should downcase name before save' do
      track = FactoryBot.create(:track, name: 'Test Track')
      expect(track.name).to eq('test track')
    end
  end

  describe 'max_speed_of' do
    let(:car) { FactoryBot.create(:car, max_speed: 100) }
    {snow: 70, gravel: 90, asphalt: 80}.each do |key, value|
      it "should return #{value} for track #{key}" do
        track = FactoryBot.create(:track, surface_type: key)
        expect(track.max_speed_of(car)).to eq(value)
      end
    end
  end
end