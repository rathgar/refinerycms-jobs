require "factory_girl"

FactoryGirl.define do
  factory :job, class: "Refinery::Jobs::Job" do
    title
    description
  end
end