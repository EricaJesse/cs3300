FactoryBot.define do
    factory :book do
      title { Faker::Book.title }
      author { Faker::Book.author }
      plot { Faker::Lorem.paragraph }
      rating { rand(1..10) }
      date_completed { Faker::Date.between(from: 10.years.ago, to: Date.today) }
      user
  
      # Add any other attributes and associations you have in your Book model
    end
  end
  