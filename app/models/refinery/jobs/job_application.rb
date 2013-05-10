require 'dragonfly'

module Refinery
  module Jobs
    class JobApplication < ActiveRecord::Base
      self.table_name = 'refinery_job_applications'

      ::Refinery::Jobs::Dragonfly.setup!

      HUMANIZED_COLUMNS = {:resume_file_name => "Resume"}

      belongs_to :job, :class_name => "Job", :foreign_key => "job_id"

      resume_accessor :resume

      attr_accessible :name, :email, :phone, :cover_letter, :resume

      validates_presence_of :name, :phone, :email, :cover_letter
      validates_format_of   :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
      validates             :resume, :presence => true
      validates_with Refinery::Jobs::Validators::FileSizeValidator

      def self.human_attribute_name(attribute, options={})
        HUMANIZED_COLUMNS[attribute.to_sym] || super
      end
    end
  end
end


