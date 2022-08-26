# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    user_name { 'John Cena' }
    user_id { 'PG00LJ' }
    email { 'john@example.com' }
    password { 'JohnCena123' }
  end
end
