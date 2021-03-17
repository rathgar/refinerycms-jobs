require 'refinery/jobs/spam_filter'

module Refinery
  module Jobs
    class JobApplicationsController < ::ApplicationController

      before_action :find_page
      before_action :find_job, only: [:new, :create, :thank_you]

      def new
        @job_application = Refinery::Jobs::JobApplication.new
        present(@page)
      end

      def thank_you
      end

      def create
        @job_application = Refinery::Jobs::JobApplication.new(job_application_params)
        @job_application.job_id ||= @job.id

        if job_application_saved_and_validated?
          redirect_to refinery.thank_you_jobs_job_applications_path(@job)
        else
          render action: 'new'
        end
      end

      protected

      def job_application_saved_and_validated?
        if @job_application.valid?
          @filter = SpamFilter.new(@job_application, request)
          @filter.call

          @filter.valid?
        end
      end

      def find_job
        @job = Refinery::Jobs::Job.live.friendly.find(params[:job_id] || params[:job_application][:job_id])
      end

      def find_page
        @page = Refinery::Page.friendly.find_by(link_url: Refinery::Jobs.page_url)
      end

      def job_application_params
        params.require(:job_application).permit(permitted_job_application_params)
      end

      private

      def permitted_job_application_params
        [
          :job_id, :name, :email, :phone, :cover_letter, :resume
        ]
      end
    end
  end
end
