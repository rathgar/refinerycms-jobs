module Refinery
  module Jobs
    class Job < ActiveRecord::Base
      extend FriendlyId
      self.table_name = 'refinery_jobs'

      friendly_id :friendly_id_source, :use => [:slugged]


      acts_as_indexed :fields => [:title, :description, :employment_terms, :hours]

      has_many :job_applications, :dependent => :destroy, :foreign_key => :job_id

      validates_presence_of   :title, :description
      validates_uniqueness_of :title

      def self.latest(number = 5)
        limit(number).order('created_at DESC')
      end

      # If title changes tell friendly_id to regenerate slug when
      # saving record
      def should_generate_new_friendly_id?
        title_changed?
      end

      def friendly_id_source
        title
      end
    end
  end
end