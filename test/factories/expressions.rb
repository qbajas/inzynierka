# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expression do
      name "MyText"
      definition "MyText"
      notes "MyText"
      examples "MyExample"
      synonyms "MySynonym" 
    end
end
