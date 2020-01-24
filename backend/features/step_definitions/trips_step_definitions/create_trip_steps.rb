Given('route with id {string} is created') do |id|
  Route.create(id: id, en_name: 't', ar_name: 't', code: 't')
end

Given('axis with id {string} is created') do |id|
  Axis.create(id: id, route: Route.first, en_name: 't', ar_name: 't', code: 't')
end

When('user request to create new trip with {string} axis_id and planned_starttime {string}') do |axis_id, planned_starttime|
  response = JSON.parse(last_response.body)
  headers = {
    'ACCEPT' => 'application/json',
    'Authorization' => response['response']
  }
  planned_start_time = DateTime.strptime(planned_starttime, '%s') unless planned_starttime.blank?
  post '/v2/trips', trip: { axis_id: axis_id,
                            planned_starttime: planned_start_time },
                    headers: headers
end
