# frozen_string_literal: true

FactoryBot.define do
    factory :departement, class: Departement do
        name { Faker::Name.unique.name }
    end
  end
  