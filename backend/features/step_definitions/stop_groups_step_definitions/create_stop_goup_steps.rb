
Given("stop group with english name {string} and arabic name {string} is created") do |en_name, ar_name|
  StopGroup.create(
    en_name: en_name,
    ar_name: ar_name
  )
end


When('user request to create new stop group with english name {string} and arabic name {string}') do |en_name, ar_name|
  response = JSON.parse(last_response.body)
  headers = {
    'ACCEPT' => 'application/json',
    'Authorization' => response['response']
  }
  post '/v2/stop_groups', stop_group: { en_name: en_name, ar_name: ar_name },
                          headers: headers
end
