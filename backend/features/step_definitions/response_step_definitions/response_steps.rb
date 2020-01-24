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
