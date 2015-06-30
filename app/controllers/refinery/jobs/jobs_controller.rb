module Refinery
  module Jobs
    class JobsController < ::ApplicationController
      include ControllerHelper

      helper :'refinery/jobs/jobs'
      before_filter :find_page
      before_filter :find_all_jobs, :only => [:index]
      before_filter :find_job, :only => [:show]

      before_filter :new_job_applicaton, :only => [:index, :show]

      def show
        @breadcrumb = OpenStruct.new({
          title: @job.title,
          url: refinery.jobs_job_url(@job)
        })
      end
    end
  end
end