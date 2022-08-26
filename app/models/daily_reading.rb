# frozen_string_literal: true

class DailyReading < ApplicationRecord
  validates :reading_date, presence: true, uniqueness: true

  belongs_to :user
end
