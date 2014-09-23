module Refinery
  module Jobs
    module ControllerHelper
      protected
        def find_all_jobs
          @jobs = Refinery::Jobs::Job.order("position ASC")
        end

        def find_job
          @job = Refinery::Jobs::Job.find(params[:id])
        end

        def find_page
          @page = Refinery::Page.find_by(:link_url => '/jobs')
        end
    end
  end
end