require "spec_helper"

module Refinery
  module Jobs
    module Admin
      describe JobApplicationsController, type: :controller do
        before do
          @job = FactoryGirl.create(:job)
          @job_application = FactoryGirl.create(:job_application, job: @job)
        end

        context "#index" do
          it "renders index template" do
            get :index, params: params[page: 1, job_id: @job.id]
            byebug
            #expect(response).to render_template("index")
          end
        end
      end
    end
  end
end