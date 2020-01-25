# frozen_string_literal: true

When('user request to get paginated offers in page {string}') do |page|
  headers = {
    'ACCEPT' => 'application/json'
  }
  params = { page: page }
  get '/api/v1/offers/paginated_index', params, headers: headers
end
