module Refinery
  module Jobs
    class Job < ActiveRecord::Base
      self.table_name = 'refinery_jobs'

      acts_as_indexed :fields => [:title, :description, :employment_terms, :hours]

      attr_accessible :title, :description, :employment_terms, :hours, :position

      has_many :job_applications, :class_name => "Refinery::Jobs::JobApplication"

      validates_presence_of   :title, :description
      validates_uniqueness_of :title

      def self.latest(number = 5)
        limit(number).order('created_at DESC')
      end

      module ShareThis
        def self.enabled?
          Refinery::Jobs.share_this_key != "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
        end
      end
    end

  end
end