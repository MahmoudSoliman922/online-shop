# frozen_string_literal: true
require 'factory_bot'

Given('departement with name {string} is created') do |name|
  FactoryBot.create(:departement, name: name)
end

When('user request to get filtered offers in departement {string}') do |departement|
  headers = {
    'ACCEPT' => 'application/json'
  }
  params = { departement: departement }
  get '/api/v1/offers/paginated_filter', params, headers: headers
end

When('user request to get filtered offers in promotion_active {string}') do |promotion_active|
  headers = {
    'ACCEPT' => 'application/json'
  }
  params = { promotion_active: promotion_active }
  get '/api/v1/offers/paginated_filter', params, headers: headers
end
