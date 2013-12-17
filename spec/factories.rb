require 'date'

FactoryGirl.define do
  startdate = Date.today + 100

  factory :user do
    email { Faker::Internet.email }
    password "password"
  end

  factory :artist do |f|
    name { Faker::HipsterIpsum.words(rand(1..3)).join ' ' }
  end

  factory :invalid_artist, :class => 'Artist' do
    name nil
  end

  factory :event do
    city { Faker::Address.city }
    date { startdate - rand(500) }
    website { Faker::Internet.domain_name }
    venue { Faker::HipsterIpsum.words(rand(1..3)).join ' ' }
    street { Faker::Address.street_address(include_secondary = false) }
  end

  factory :invalid_event, :class => 'Event' do
    city nil
    date { startdate - rand(500) }
  end


end



