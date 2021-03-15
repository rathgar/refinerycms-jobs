module Refinery
  module Jobs
    include ActiveSupport::Configurable

    config_accessor :send_notifications_for_job_applications_marked_as_spam
    config_accessor :from_name, :page_url, :page_path_thank_you
    config_accessor :recaptcha_site_key

    self.send_notifications_for_job_applications_marked_as_spam = false
    self.from_name = "no-reply"
    self.page_url = "/jobs"
    self.page_path_thank_you = "/:job_id/job_applications/thank_you"
    self.recaptcha_site_key = nil
  end
end
