# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
      email {"aa#{Time.now + rand(1000)}@aa.pl"}
      password "abcabc"
    end
end
