require 'bundler'
require 'faker'
Bundler.require


(Faker.constants - [:Config, :Base]).each do |constant|
  klass = Faker::const_get(constant)
  klass.methods(false).each do |method|
    get "/#{constant.to_s.downcase}/#{method.to_s.downcase}" do
      parameters = klass.method(method).parameters.map{ |parameters| params[parameters.last] }.compact
      json klass.send(method, *parameters)
    end
  end
end
