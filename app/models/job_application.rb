require 'paperclip'
  
class JobApplication < ActiveRecord::Base
  HUMANIZED_COLUMNS = {:resume_file_name => "Resume"}

  def self.human_attribute_name(attribute)
    HUMANIZED_COLUMNS[attribute.to_sym] || super
  end
  validates_presence_of :name, :phone, :email, :cover_letter
  validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
  belongs_to :job, :class_name => "Job", :foreign_key => "job_id"

  has_attached_file :resume
  validates_attachment_presence :resume
end
