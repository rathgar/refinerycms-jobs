module Refinery
  module Jobs
    class JobMailer < ActionMailer::Base
      default from: "\"#{Refinery::Core.site_name}\" <no-reply@wtca.org>"

      def notification(job_application, request)
        @job_application = job_application
        @host            = [request.protocol, request.host_with_port].join

        mail to:      Refinery::Setting.find_or_set('job_applications_recipients', 'jobs@example.org', destroyable: false, scoping: 'jobs', restricted: false, form_value_type: 'text_area'),
             subject: Refinery::Setting.find_or_set('job_applications_email_subject', 'New job application from your website', destroyable: false, scoping: 'jobs', restricted: false, form_value_type: 'text_area')
      end

    end
  end
end