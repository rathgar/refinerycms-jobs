module Refinery
  module Jobs
    class Job < ActiveRecord::Base

      acts_as_indexed :fields => [:title, :description, :employment_terms, :hours]

      has_many :job_applications, :class_name => "job_application"

      validates_presence_of   :title, :description
      validates_uniqueness_of :title

    end
  end
end