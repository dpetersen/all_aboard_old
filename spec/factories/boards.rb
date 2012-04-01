FactoryGirl.define do |f|
  factory :board do
    name "Board Name"
  end

  factory :slide do
    layout_name "Quarters"
    position 1
    board
  end

  factory :perspective_assignment do
    source_name "NonExistantSource"
    perspective_name "A Non-Existant Perspective"
    slide
  end
end
