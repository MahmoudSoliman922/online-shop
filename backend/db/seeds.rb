# frozen_string_literal: true

require 'factory_bot'

puts 'Running seeds ...'

100.times do |_i|
  FactoryBot.create(:product_promotion)
end

departement = FactoryBot.create(:departement, name: 'Trufla')
product = FactoryBot.create(:product, departement: departement)
promotion = FactoryBot.create(:promotion)
FactoryBot.create(:product_promotion, product: product, promotion: promotion)

puts 'Finished!'
