module Refinery
  module Jobs
    class JobApplicationsController < ::ApplicationController
      include ControllerHelper

      before_filter :find_all_job_applications
      before_filter :find_page

      def new
        @job_application = Refinery::Jobs::JobApplication.new
        @job             = Refinery::Jobs::Job.friendly.find(params[:job_id])

        present(@page)
      end

      def create
        @job_application = Refinery::Jobs::JobApplication.new(job_application_params)
        @job_id_integer  = Refinery::Jobs::Job.friendly.find(params[:job_id])

        @job_application.job_id = @job_id_integer.id
        @job                    = @job_application.job

        respond_to do |format|
          if @job_application.save
            flash[:notice] = 'Job application was successfully created.'
            begin
              Refinery::Jobs::JobMailer.notification(@job_application, request).deliver
            rescue
              logger.warn "There was an error delivering a notification.\n#{$!}\n"
            end
            format.html { redirect_to refinery.jobs_job_job_application_url(@job, @job_application) }
          else
            format.html { render :action => "new" }
          end
        end
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @jobs in the line below:
      end

      def show
        @job_application = Refinery::Jobs::JobApplication.find(params[:id])
        @job             = @job_application.job

        present(@page)

        respond_to do |format|
          format.html { render :action => 'show' }
          format.xml  { render :xml => @future_student }
        end
      end

      private
        def job_application_params
          params.require(:job_application).permit!
        end
    end
  end
end