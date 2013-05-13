module Refinery
  module Jobs
    class JobsController < ::ApplicationController

      before_filter :find_all_jobs
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @jobs in the line below:
        present(@page)
      end

      def show
        @job = Refinery::Jobs::Job.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @jobs in the line below:
        present(@page)
      end

    protected

      def find_all_jobs
        @jobs = Refinery::Jobs::Job.order("position ASC")
      end

      def find_page
        @page = Refinery::Page.find_by_link_url("/jobs")
      end

    end
  end
end
