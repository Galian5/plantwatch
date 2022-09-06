FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'John' }
    email { 'jdoe@mail.com' }
    password { 'xxxxxx'}
    created_at { Time.now }
    updated_at { Time.now }
  end
end
