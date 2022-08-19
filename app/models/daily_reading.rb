# frozen_string_literal: true

class DailyReading < ApplicationRecord
  validates :reading_date, presence: true

  validate :ensure_the_read_date_has_a_unique_date

  def ensure_the_read_date_has_a_unique_date
    return unless reading_date

    last_reading_date = DailyReading.last&.reading_date&.strftime('%d/%m/%y')

    return unless last_reading_date == reading_date.strftime('%d/%m/%y')

    errors.add(:reading_date, 'is not a valid date')
  end
end
