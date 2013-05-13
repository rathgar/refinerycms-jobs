module Refinery
  module Jobs
    include ActiveSupport::Configurable

    config_accessor :share_this_key

    self.share_this_key = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  end
end
