# frozen_string_literal: true

class AddUserReferenceToDailyReadings < ActiveRecord::Migration[7.0]
  def change
    add_reference :daily_readings, :user, default: 0, null: false, foreign_key: true
  end
end
