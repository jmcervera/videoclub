FactoryGirl.define do
  factory :episode do
    sequence(:number) {|n| n }
    title "MyString"
    plot "MyText"
    season
  end

end
