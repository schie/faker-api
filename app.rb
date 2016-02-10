require 'bundler'
require 'faker'
Bundler.require


(Faker.constants - [:Config, :Base]).each do |constant|
  constant_class = Faker::const_get(constant)
  constant_class.methods(false).each do |method|
    get "/#{constant.to_s.downcase}/#{method.to_s.downcase}" do
      json constant_class.send(method)
    end
  end
end
