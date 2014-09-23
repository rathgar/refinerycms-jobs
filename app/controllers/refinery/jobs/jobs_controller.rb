module Refinery
  module Jobs
    class JobsController < ::ApplicationController

      # helper :'refinery/blog/jobs'
      before_filter :find_page, :find_all_jobs
      before_filter :find_job

      protected

        def find_all_jobs
          @jobs = Refinery::Jobs::Job.order("position ASC")
        end

        def find_page
          @page = Refinery::Page.find_by(:link_url => '/jobs')
        end

        def find_job
          @job = Refinery::Jobs::Job.find(params[:id])
        end
    end
  end
end