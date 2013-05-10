module Refinery
  module Jobs
    module Admin
      class JobsController < ::Refinery::AdminController

        crudify :'refinery/jobs/job', :title_attribute => :title

        def job_applications
          find_job
          @job_applications = Refinery::Jobs::JobApplication.paginate :page => params[:page],
                                                   :conditions => "job_id = " + params[:id]
        end
      end
    end
  end
end