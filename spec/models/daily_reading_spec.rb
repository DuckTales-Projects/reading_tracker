# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DailyReading, type: :model do
  describe '.validations' do
    subject(:daily_reading_today) { create(:daily_reading) }

    it { expect(daily_reading_today).to validate_presence_of(:reading_date) }
    it { expect(daily_reading_today).to validate_uniqueness_of(:reading_date) }

    context 'when the reading_date is valid' do
      let(:daily_reading_today) { create(:daily_reading, reading_date: Date.yesterday) }
      let(:new_reading_date) { create(:daily_reading, reading_date: Date.current, user_id: daily_reading_today.user_id) }

      before do
        daily_reading_today
        new_reading_date
      end

      it 'ensures the reading_date has a unique by date' do
        expect(described_class.count).to eq 2
      end
    end

    context 'when there is already a reading_date today' do
      let(:daily_reading_today) { create(:daily_reading, reading_date: Date.current) }
      let(:invalid_date) { build(:daily_reading, reading_date: Date.current) }

      before do
        daily_reading_today
        invalid_date
      end

      it 'ensures the reading_date has a unique by date' do
        expect(invalid_date).to be_invalid
        expect(invalid_date.errors.count).to eq 1
        expect(invalid_date.errors.messages[:reading_date]).to include('has already been taken')
      end
    end
  end
end
