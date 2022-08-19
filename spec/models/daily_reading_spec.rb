# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DailyReading, type: :model do
  describe '.validations' do
    it { is_expected.to validate_presence_of(:reading_date) }

    it '.ensure_the_read_date_has_a_unique_date' do
      create(:daily_reading, reading_date: Time.zone.now)
      invalid_date = build(:daily_reading, reading_date: 1.minute.from_now)

      expect(invalid_date).not_to be_valid
      expect(invalid_date.errors.full_messages).to include('Reading date is not a valid date')
      expect(invalid_date.errors.count).to eq 1
    end
  end
end
