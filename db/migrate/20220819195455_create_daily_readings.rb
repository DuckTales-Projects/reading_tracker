# frozen_string_literal: true

class CreateDailyReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_readings do |t|
      t.date :reading_date, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
