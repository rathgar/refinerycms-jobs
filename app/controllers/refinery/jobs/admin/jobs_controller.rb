module Refinery
  module Jobs
    module Admin
      class JobsController < ::Refinery::AdminController

        crudify :'refinery/jobs/job', :title_attribute => :title, :xhr_paging => true

        def job_applications
          find_job
          @job_applications = @job.job_applications.paginate :page => params[:page]
        end

        private
          def job_params
            params.require(:job).permit(:title, :description, :employment_terms, :hours, :position, :draft, :published_at)
          end
      end
    end
  end
end