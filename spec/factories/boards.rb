FactoryGirl.define do |f|
  factory :board, class: AllAboard::Board do
    name "Board Name"
  end

  factory :slide, class: AllAboard::Slide do
    layout_name "Quarters"
    position 1
    board
  end

  factory :perspective_assignment, class: AllAboard::PerspectiveAssignment do
    source_name "NonExistantSource"
    perspective_name "A Non-Existant Perspective"
    slide
  end
end
