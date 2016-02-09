require 'bundler'
require 'faker'
Bundler.require

get '/' do
  json({ status: :ok })
end

get '/hacker' do
  json Faker::Hacker.say_something_smart
end
