module Refinery
  module Jobs
    class Job < ActiveRecord::Base
      self.table_name = 'refinery_jobs'

      acts_as_indexed :fields => [:title, :description, :employment_terms, :hours]

      attr_accessible :title, :description, :employment_terms, :hours, :position

      has_many :job_applications, :class_name => "job_application"

      validates_presence_of   :title, :description
      validates_uniqueness_of :title

    end
  end
end