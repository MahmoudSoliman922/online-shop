require 'factory_bot'

100.times do |i|
    FactoryBot.create(:product_promotion)
end