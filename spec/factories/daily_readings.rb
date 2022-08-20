# frozen_string_literal: true

FactoryBot.define do
  factory :daily_reading do
    reading_date { Time.zone.today }
  end
end
