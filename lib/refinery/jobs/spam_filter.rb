require 'httpclient'
require 'uri'

module Refinery
  module Jobs
    class SpamFilter
      GOOGLE_SITEVERIFY_URL = 'https://www.google.com/recaptcha/api/siteverify'.freeze

      def initialize(job_application, request)
        @job_application = job_application
        @request = request
        @params = request.params
      end

      def call
        if recaptcha?
          if recaptcha_validated?
            @valid = true
            @job_application.save
          else
            @job_application.errors.add(:base, ::I18n.t(:captcha_invalid, scope: 'refinery.jobs.spam_filter'))
          end
        end

        if notify?
          send_notification_email!
          send_confirmation_email!
        end
      end

      def valid?
        @valid == true
      end

      def notify?
        valid?
      end

      def recaptcha_validated?
        return true unless recaptcha?
        # avoid doing a second request if we already have a result.
        return @recaptcha_validated unless @recaptcha_validated.nil?

        @recaptcha_validated = recaptcha_success?
      end

      private

      def recaptcha?
        Jobs.recaptcha_site_key.present?
      end

      def recaptcha_success?
        http = HTTPClient.new
        response = http.get(
          GOOGLE_SITEVERIFY_URL,
          secret: Rails.application.secrets.recaptcha_secret_key,
          response: @params['g-recaptcha-response']
        )
        JSON.parse(response.body)["success"] == true
      end

      def send_notification_email!
        begin
          JobMailer.notification(@job_application, @request).deliver_now
        rescue
          Rails.logger.warn "There was an error delivering an inquiry notification.\n#{$!}\n"
        end
      end

      def send_confirmation_email!
        if Setting.send_confirmation?
          begin
            JobMailer.confirmation(@job_application, @request).deliver_now
          rescue
            Rails.logger.warn "There was an error delivering an inquiry confirmation:\n#{$!}\n"
          end
        end
      end
    end
  end
end
