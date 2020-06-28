FactoryBot.define do
  factory :product do
    name {Faker::Device.model_name}
    imageUrl {Faker::Internet.url}
    price {rand(0.0..999.0) }
  end
end