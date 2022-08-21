# frozen_string_literal: true

require 'rails_helper'

describe 'DailyReading', type: :request do
  describe 'POST /daily_readings' do
    subject(:post_to_daily_readings) { post daily_readings_path, params: params }

    context 'when the request is successful' do
      let(:params) { Time.zone.today }

      before { post_to_daily_readings }

      it 'returns a successful response' do
        expect(response).to have_http_status :created
        expect(JSON.parse(response.body)).to eq 'Read successfully confirmed!'
        expect(DailyReading.count).to eq 1
      end
    end
  end
end
