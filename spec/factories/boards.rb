FactoryGirl.define do |f|
  factory :board do
    name "Board Name"
  end

  factory :slide do
    layout_name "Quarters"
    position 1
  end
end
