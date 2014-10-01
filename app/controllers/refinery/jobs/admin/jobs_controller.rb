module Refinery
  module Jobs
    module Admin
      class JobsController < ::Refinery::AdminController
        crudify :'refinery/jobs/job',
                :order => 'published_at DESC',
                :include => [:translations]

        def job_applications
          find_job
          @job_applications = @job.job_applications.paginate :page => params[:page]
        end

        private
          def job_params
            params.require(:job).permit(
              :title,
              :description,
              :employment_terms,
              :hours,
              :position,
              :draft,
              :published_at,
              :fill,
              :ref,
              :education,
              :experience,
              :skills,
              :languages,
              :salary,
              :length,
              :employment_date,
              :contact
            )
          end

        protected
          def find_job
            @job = Refinery::Jobs::Job.find_by_slug_or_id(params[:id])
          end
      end
    end
  end
end