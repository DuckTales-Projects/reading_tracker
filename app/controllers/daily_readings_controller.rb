# frozen_string_literal: true

class DailyReadingsController < ApplicationController
  def create
    return render status: :ok, body: I18n.t('read_confirmed') if DailyReading.last&.reading_date == Date.current

    DailyReading.create!(daily_readings_params)

    render status: :created, body: I18n.t('read_confirmed')
  end

  private

  def daily_readings_params
    params.require(:daily_readings).permit(:user_id).merge(reading_date: Date.current)
  end
end
