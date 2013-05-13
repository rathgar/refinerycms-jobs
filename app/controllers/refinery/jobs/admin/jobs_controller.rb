module Refinery
  module Jobs
    module Admin
      class JobsController < ::Refinery::AdminController

        crudify :'refinery/jobs/job', :title_attribute => :title

        def job_applications
          find_job
          @job_applications = @job.job_applications.paginate :page => params[:page]
        end
      end
    end
  end
end