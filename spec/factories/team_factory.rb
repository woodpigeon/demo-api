FactoryGirl.define do

  factory :team do
    name 'Team name'
    email Faker::Internet.email
  end

end