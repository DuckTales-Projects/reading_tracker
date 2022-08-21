# frozen_string_literal: true

class DailyReadingsController < ApplicationController
  def create
    return render status: :ok, body: t('read_confirmed') if DailyReading.last&.reading_date == Time.zone.today

    DailyReading.create!(daily_readings_params)
    render status: :created, body: t('read_confirmed')
  end

  private

  def daily_readings_params
    params.require(:daily_readings).permit(:reading_date)
  end
end
