# frozen_string_literal: true

class CreateOffersView < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE OR REPLACE VIEW public.offers_view AS
            SELECT
              d.name as departement_name,
              prod.name as product_name,
              prod.price as product_price,
              prom.code as prmotion_code,
              prom.active as prmotion_active,
              prom.discount as prmotion_discount
            FROM products prod
            INNER JOIN departements d ON prod.departement_id = d.id
            INNER JOIN product_promotions prod_prom ON prod_prom.product_id = prod.id
            INNER JOIN promotions prom ON prod_prom.promotion_id = prom.id
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP VIEW IF EXISTS public.offers_view;
        SQL
      end
    end
  end
end
