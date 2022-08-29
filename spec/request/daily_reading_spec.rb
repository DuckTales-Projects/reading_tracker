# frozen_string_literal: true

require 'rails_helper'

describe 'DailyReading', type: :request do
  describe 'POST /daily_readings' do
    subject(:post_to_daily_readings) { post daily_readings_path, params: params }

    let(:user) { create(:user) }
    let(:params) { { daily_readings: { user_id: user.id } } }

    context 'when the request is successful' do
      before { post_to_daily_readings }

      it 'returns a successful response' do
        expect(response).to have_http_status :created
        expect(response.body).to eq 'Read successfully confirmed!'
        expect(DailyReading.count).to eq 1
      end
    end

    context 'when receive a request more than once in a day' do
      let(:create_daily_reading) { create(:daily_reading, reading_date: Date.current, user_id: user.id) }

      before do
        create_daily_reading
        post_to_daily_readings
      end

      it 'must ignore all other requests' do
        expect(DailyReading.count).to eq 1
        expect(response).to have_http_status :ok
        expect(response.body).to eq 'Read successfully confirmed!'
      end
    end

    context 'when the system receives a requisition with the incorrect date' do
      let(:create_daily_reading) { create(:daily_reading, reading_date: 2.days.ago.to_date, user_id: user.id) }
      let(:params) { { daily_readings: { reading_date: Date.yesterday, user_id: user.id } } }
      let(:old_daily_reading) { DailyReading.first.reading_date }
      let(:last_daily_reading) { DailyReading.last.reading_date.to_date }

      before do
        create_daily_reading
        post daily_readings_path, params: { daily_readings: { user_id: user.id } }
        post_to_daily_readings
      end

      it 'only the reading referring to the correct date must be confirmed' do
        expect(response).to have_http_status :ok
        expect(response.body).to eq 'Read successfully confirmed!'
        expect(DailyReading.count).to eq 2
        expect(old_daily_reading).to eq 2.days.ago.to_date
        expect(last_daily_reading).to eq Date.current
        expect(last_daily_reading).not_to eq Date.yesterday
      end
    end
  end
end
