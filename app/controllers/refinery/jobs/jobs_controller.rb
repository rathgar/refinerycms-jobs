module Refinery
  module Jobs
    class JobsController < ::ApplicationController
      include ControllerHelper

      # helper :'refinery/jobs/jobs'
      before_filter :find_page
      before_filter :find_all_jobs, :only => [:index]
      before_filter :find_job, :only => [:show]
    end
  end
end