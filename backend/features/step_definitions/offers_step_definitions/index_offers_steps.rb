# frozen_string_literal: true

When('user request to get all offers') do
  headers = {
    'ACCEPT' => 'application/json'
  }
  get '/api/v1/offers', headers: headers
end
