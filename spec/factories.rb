FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "#{n}@example.com" }
    password "password"
  end

  factory :artist do
    sequence(:name) { |n| "Artist #{n}"}
    user
  end

  factory :event do
    sequence(:date) { |n| "Januray #{n}"}
    city "Some City"
    website "http://www.example.com"
    venue "Some Venue"
    street "123 some street"
  end

end

