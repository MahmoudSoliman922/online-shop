# frozen_string_literal: true

FactoryBot.define do
  factory :promotion, class: Promotion do
    code { Faker::Code.unique.nric }
    discount { Faker::Number.number(digits: 2) }
  end
end
