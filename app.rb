require('sinatra')
require('sinatra/reloader')
require('./lib/parcels')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/parcels') do
  height = params.fetch('height').to_i
  width = params.fetch('width').to_i
  length = params.fetch('length').to_i
  distance = params.fetch('distance').to_i
  weight = params.fetch('weight').to_i
  speed = params.fetch('speed')
  gift_wrap = params.fetch('gift-wrap')
  code = params.fetch('discount')
  parcel = Parcel.new(width, length, height)
  @shipping_cost = (parcel.cost_to_ship(distance, weight, speed, gift_wrap) - parcel.discount(code)).round(2)
  erb(:parcels)
end
