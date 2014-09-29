module Refinery
  module Jobs
    module ControllerHelper
      protected
        def find_all_jobs
          @jobs = Refinery::Jobs::Job.friendly.order("position ASC")
        end

        def find_job
          @job = Refinery::Jobs::Job.friendly.find(params[:id])
        end

        def find_page
          @page = Refinery::Page.friendly.find_by(:link_url => '/jobs')
        end

        def find_all_job_applications
          @jobs = Refinery::Jobs::Job.friendly.order("position ASC")
        end
    end
  end
end