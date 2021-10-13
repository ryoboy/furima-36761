FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(/\A[a-z\d]{8}+\z/i)}
    password_confirmation { password }
    birthday              { Faker::Date.backward }
    first_name            { person.last.kanji }
    name                  { person.first.kanji }
    first_name_reading    { person.last.katakana }
    name_reading          { person.first.katakana }
  end
end
