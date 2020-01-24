# frozen_string_literal: true

FactoryBot.define do
    factory :product_promotion, class: ProductPromotion do
        promotion { create(:promotion) }
        product { create(:product) }
    end
  end
  