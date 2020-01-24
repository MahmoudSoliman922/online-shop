# frozen_string_literal: true

class OffersSerializer < ActiveModel::Serializer
  attributes :departement_name,
             :product_name,
             :product_price,
             :promotion_code,
             :promotion_active,
             :promotion_discount
end
