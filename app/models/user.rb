# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, :user_id, :password, presence: true
  validates :user_id, uniqueness: true

  has_many :daily_readings, dependent: :destroy
end
