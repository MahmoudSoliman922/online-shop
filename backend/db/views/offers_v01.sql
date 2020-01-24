SELECT
  d.name as departement_name,
  prod.name as product_name,
  prod.price as product_price,
  prom.code as promotion_code,
  prom.active as promotion_active,
  prom.discount as promotion_discount
FROM products prod
INNER JOIN departements d ON prod.departement_id = d.id
INNER JOIN product_promotions prod_prom ON prod_prom.product_id = prod.id
INNER JOIN promotions prom ON prod_prom.promotion_id = prom.id