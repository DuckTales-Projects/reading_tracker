# frozen_string_literal: true

Rails.application.routes.draw do
  resources :daily_readings, only: [:create]
end
