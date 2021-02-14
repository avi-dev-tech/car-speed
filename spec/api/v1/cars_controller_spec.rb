require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do
  let(:track) { FactoryBot.create(:track) }
  let(:car) { FactoryBot.create(:car, max_speed: 100) }

  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe 'GET #show' do
    it 'should return car details with valid car slug' do
      get :show, params: { id: car.slug }
      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body['car']['id']).to eq(car.id)
      expect(body['car']['car_clug']).to eq(car.slug)
      expect(body['car']['max_speed']).to eq("#{car.max_speed}km/h")
      expect(body['car']['max_speed_on_track']).to eq('no track selected')
    end

    it 'should return car max speed on track with valid track name' do
      get :show, params: { id: car.slug, track: track.name }
      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body['car']['max_speed_on_track']).to eq('70.0km/h')
    end

    it 'should return track not found with invalid track name' do
      get :show, params: { id: car.slug, track: 'invalid' }
      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body['car']['max_speed_on_track']).to eq('track not found')
    end

    it 'should return error message with invalid car slug' do
      get :show, params: { id: 'invalid id' }
      expect(response).to have_http_status(:not_found)
    end
  end
end