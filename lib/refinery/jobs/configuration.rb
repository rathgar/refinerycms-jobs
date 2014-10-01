module Refinery
  module Jobs
    include ActiveSupport::Configurable

    config_accessor :send_notifications_for_job_applications_marked_as_spam
    config_accessor :from_name

    self.send_notifications_for_job_applications_marked_as_spam = false
    self.from_name = "no-reply"
  end
end