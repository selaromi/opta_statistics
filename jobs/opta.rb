require 'blanket'
# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '60s', :first_in => 0 do |job|
  send_event('salomon', { 'current':rand(10) })
  end

SCHEDULER.every '60s', :first_in => 0 do |job|
  api = Blanket::wrap("http://prost.herokuapp.com/api/v1")
  beer = api.beer.rand.get.payload
  send_event('beer', { :text => beer.title,
                       :moreinfo => "#{beer.abv} %"
                   })
end