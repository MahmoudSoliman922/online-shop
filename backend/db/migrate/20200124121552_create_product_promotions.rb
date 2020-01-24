# frozen_string_literal: true

class CreateProductPromotions < ActiveRecord::Migration[5.2]
  def change
    create_table :product_promotions, id: :uuid do |t|
      t.belongs_to :product, index: true, type: :uuid
      t.belongs_to :promotion, index: true, type: :uuid

      t.timestamps
    end
  end
end
