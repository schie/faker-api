require 'bundler'
require 'faker'
Bundler.require

get '/' do
  json({ status: :ok, count: 100 })
end
get '/name' do
  json Faker::Name.name
end
