FactoryBot.define do
  factory :user do
    first_name            { 'Joe' }
    last_name             { 'Soap' }
    sequence(:email)      { |n| "user#{n}@example.com" }
    password              { 'pass1234' }
    password_confirmation { 'pass1234' }
  end
end
