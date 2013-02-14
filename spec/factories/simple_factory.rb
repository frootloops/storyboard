FactoryGirl.define do
  factory :user do
    name     { Forgery::Name.full_name }
    email    { Forgery::Email.address }
    location { Forgery::Address.city }
    password { Forgery::Basic.password }
  end

  factory :topic do
    name { Forgery::LoremIpsum.words(2, random: true) }
    slug { Forgery::LoremIpsum.words(1, random: true).downcase }
  end

end