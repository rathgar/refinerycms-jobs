require "factory_girl"

FactoryGirl.define do
  factory :job, class: "Refinery::Jobs::Job" do
    title
    description
    published_at
  end
end