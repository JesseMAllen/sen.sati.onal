FactoryGirl.define do
  factory :bookmark do
    sequence(:name) { |n| "Bookmark #{n}" }
    sequence(:url) { |n| "www.bookmark_#{n}.com" }
  end
end