module Refinery
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