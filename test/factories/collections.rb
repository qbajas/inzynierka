# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :collection do
      name "MyString"
      user_id 1
      description "MyText"
    end

  factory :common_collection, :class => Collection do
    name "Common"
  end
end
