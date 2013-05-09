module Refinery
  module Jobs
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_jobs

      initializer 'init plugin' do
        Refinery::Plugin.register do |plugin|
          plugin.pathname   = root
          plugin.name       = "refinery_jobs"
          plugin.version    = '2.0.0'
          plugin.menu_match = /(admin|refinery)\/(jobs|vacancies)?$/
          plugin.activity   = { :class_name => :'refinery/job' }
          plugin.url        = proc { Refinery::Jobs::Engine.routes.url_helpers.admin_jobs_path }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Jobs)
      end
    end
  end
end