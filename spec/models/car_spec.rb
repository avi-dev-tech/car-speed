require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'schema' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:slug).of_type(:string) }
    it { should have_db_column(:max_speed).of_type(:integer) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:max_speed) }
  end

  describe 'friendly_id' do
    it 'should create a slug based on name' do
      car = FactoryBot.create(:car, name: 'test car')

      expect(car.friendly_id).to eq('test-car')
    end
  end

  describe 'downcase_name' do
    it 'should downcase name before save' do
      track = FactoryBot.create(:track, name: 'Test Track')
      expect(track.name).to eq('test track')
    end
  end
end