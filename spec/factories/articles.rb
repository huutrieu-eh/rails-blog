FactoryBot.define do
  factory :article do
    trait :ruby_article do
      title { "Ruby on Rails" }
      body { "Introduction to Rails" }
      status { "public" }
    end
  end
end