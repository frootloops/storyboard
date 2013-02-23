FactoryGirl.define do
  factory :user do
    name     { Forgery::Name.full_name }
    email    { Forgery::Email.address }
    location { Forgery::Address.city }
    password 'password'
  end

  factory :topic do
    name { Forgery::LoremIpsum.words(2, random: true) }
    slug { Forgery::LoremIpsum.words(1, random: true).downcase }
  end

  factory :guide do
    title { Forgery::LoremIpsum.words(4) }
    description { Forgery::LoremIpsum.words(25) }
    topic_id 1
    slug "bestslug"
    supply ['ruby', 'c++', 'html']
  end

end