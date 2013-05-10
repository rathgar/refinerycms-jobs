module Refinery
  module Jobs
    class JobMailer < ActionMailer::Base
      default from: "\"#{Refinery::Core.site_name}\" <no-reply@wtca.org>"

      def notification(job_application, request)
        @job_application = job_application
        @host            = [request.protocol, request.host_with_port].join

        mail(:to      => Refinery::Setting.get('job_applications_recipients', scoping: 'jobs'),
             :subject => Refinery::Setting.get('job_applications_email_subject', scoping: 'jobs'))
      end

    end
  end
end