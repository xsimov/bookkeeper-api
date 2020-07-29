# frozen_string_literal: true

FactoryBot.define do
  factory :provider do
    sequence(:name) { |n| "Provider ##{n}" }
    contact_phone { Faker::PhoneNumber.cell_phone_with_country_code }
  end
end
