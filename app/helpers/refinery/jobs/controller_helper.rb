module Refinery
  module Jobs
    module ControllerHelper
      protected
        def find_all_jobs
          @jobs = Refinery::Jobs::Job.friendly.order("position ASC").page(params[:page])
        end

        def find_job
          @job = Refinery::Jobs::Job.friendly.find(params[:id])
        end

        def find_page
          @page = Refinery::Page.friendly.find_by(:link_url => '/jobs')
        end
    end
  end
end