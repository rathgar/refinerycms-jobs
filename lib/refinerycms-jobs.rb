require 'refinery'
require File.expand_path('../jobs', __FILE__)

module Refinery
  module Jobs
    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_jobs"
          plugin.menu_match = /(admin|refinery)\/(jobs|vacancies)?$/
          plugin.url = {:controller => '/admin/jobs', :action => 'index'}
          plugin.version = 1.0
          plugin.activity = {
            :class => Job,
            :url_prefix => "edit",
            :title => 'job_title'
          }
        end
      end
    end
  end
end