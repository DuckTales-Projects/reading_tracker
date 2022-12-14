# frozen_string_literal: true

class DailyReadingsController < ApplicationController
  def create
    return render status: :ok, body: I18n.t('read_confirmed') if DailyReading.last&.reading_date == Date.current

    DailyReading.create!(reading_date: Date.current)

    render status: :created, body: I18n.t('read_confirmed')
  end
end
