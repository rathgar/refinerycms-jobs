require 'rails/generators/migration'

class RefinerycmsJobsGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration

  source_root File.expand_path('../templates/', __FILE__)
  argument :name, :type => :string, :default => 'jobs', :banner => ''

  def generate
    # seed file
    template 'db/seeds/seed.rb', Rails.root.join('db/seeds/refinerycms_jobs.rb')

    next_migration_number = ActiveRecord::Generators::Base.next_migration_number(File.dirname(__FILE__))
    template('db/migrate/migration_number_create_singular_name.rb',
             Rails.root.join("db/migrate/#{next_migration_number}_create_#{singular_name}.rb"))

     puts "------------------------"
     puts "Now run:"
     puts "rake db:migrate"
     puts "------------------------"
  end
end