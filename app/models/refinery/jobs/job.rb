module Refinery
  module Jobs
    class Job < ActiveRecord::Base
      self.table_name = 'refinery_jobs'

      acts_as_indexed :fields => [:title, :description, :employment_terms, :hours]

      has_many :job_applications, :dependent => :destroy, :foreign_key => :job_id

      validates_presence_of   :title, :description
      validates_uniqueness_of :title

      def self.latest(number = 5)
        limit(number).order('created_at DESC')
      end
    end
  end
end