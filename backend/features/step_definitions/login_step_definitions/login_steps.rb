Given('user with name {string} and password {string} is created') do |name, password|
  organisation = Organisation.create(en_name: 'MM', ar_name: 'MM',
                                     is_super_organisation: false)
  Admin.create(
    username: name,
    password: password,
    first_name: 'test',
    last_name: 'test',
    organisation: organisation,
    is_super_admin: true,
    permission_number: 0
  )
end

Given('user with name {string} and password {string} is logged in successfully') do |name, password|
  headers = {
    'ACCEPT' => 'application/json'
  }
  post '/v2/login', login: { username: name, password: password }, headers: headers

  expect(last_response.content_type).to include('application/json')
  expect(last_response.status).to eq 200
  body = JSON.parse(last_response.body)
  expect(body['success']).to eq true
end
