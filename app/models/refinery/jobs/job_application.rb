require 'dragonfly'

module Refinery
  module Jobs
    class JobApplication < ActiveRecord::Base
      extend FriendlyId

      self.table_name = 'refinery_job_applications'

      # ::Refinery::Jobs::Dragonfly.setup!

      # HUMANIZED_COLUMNS = {:resume_file_name => "Resume"}

      belongs_to :job, :class_name => "Refinery::Jobs::Job", :foreign_key => "job_id"

      # resume_accessor :resume

      validates_presence_of :name, :phone, :email, :cover_letter
      validates :email, format: {
        with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      }, length: { maximum: 255 }
      # validates             :resume, :presence => true
      # validates_with Refinery::Jobs::Validators::FileSizeValidator

      # def self.human_attribute_name(attribute, options={})
      #   HUMANIZED_COLUMNS[attribute.to_sym] || super
      # end

      # def self.latest(number = 5)
      #   limit(number).order('created_at DESC')
      # end
    end
  end
end


