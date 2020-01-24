# frozen_string_literal: true

FactoryBot.define do
    factory :product, class: Product do
        name { Faker::Name.unique.name }
        price { Faker::Number.number(digits: 3) }
        departement { create(:departement) }
    end
  end
  