Then('successful json response returned to the user') do
  expect(last_response.content_type).to include('application/json')
  expect(last_response.status).to eq 200
  body = JSON.parse(last_response.body)
  expect(body['success']).to eq true
end

Then('failure json response returned to the user') do
  expect(last_response.content_type).to include('application/json')
  expect(last_response.status).to eq 200
  body = JSON.parse(last_response.body)
  expect(body['success']).to eq false
end

Then('response returned to the user with error {string}') do |error|
  expect(last_response.body).to include(error)
end

Then("response returned to the user with page {string}") do |page|
  parsed_response = JSON.parse(last_response.body)
  expect(parsed_response['response']).to include('page')
  expect(parsed_response['response']['page'].to_s).to eq page
end

Then("response returned to the user with {string} records") do |records_count|
  parsed_response = JSON.parse(last_response.body)
  expect(parsed_response['response']['offers'].length.to_s).to eq records_count
end