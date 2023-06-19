FactoryBot.define do
  factory :user do
    nickname { 'suzuki' }
    date_of_birth { Date.new(2000, 1, 1) } 
    email { Faker::Internet.unique.email }
    password { 'test1234' }
    password_confirmation { password }
    last_name {'鈴木'}
    first_name {'健太'}
    last_name_kana {'スズキ'}
    first_name_kana {'ケンタ'}

   
  end
end