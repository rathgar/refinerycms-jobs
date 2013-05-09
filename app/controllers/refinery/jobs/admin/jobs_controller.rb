module Refinery
  module Jobs
  module Admin
    class JobsController < ::Refinery::AdminController

      crudify :job, :title_attribute => :title

      def job_applications
        @job_applications = JobApplication.paginate :page => params[:page],
                                                 :conditions => "job_id = " + params[:id]
      end
    end
  end
end
end