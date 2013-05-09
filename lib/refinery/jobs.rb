require 'refinerycms-core'
require 'refinerycms-settings'
require 'dragonfly'

module Refinery
  autoload :JobsGenerator, 'generators/refinery/jobs/jobs_generator'

  module Jobs
    require 'refinery/jobs/engine'
    require 'refinery/jobs/configuration'
    autoload :Dragonfly, 'refinery/jobs/dragonfly'

    class << self
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join("spec/factories").to_s ]
      end
    end
  end
end