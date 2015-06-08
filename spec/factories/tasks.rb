FactoryGirl.define do
  factory :task do
    sequence(:description) { |n| "task #{n}" }
  end
end