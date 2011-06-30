Gem::Specification.new do |s|
  s.name              = %q{refinerycms-jobs}
  s.version           = %q{1.0.0.0}
  s.description       = %q{A really straightforward open source Ruby on Rails jobs engine designed for integration with RefineryCMS.}
  s.date              = %q{2011-06-29}
  s.summary           = %q{Ruby on Rails jobs engine for RefineryCMS.}
  s.authors           = %w(Jim\ Croft Rafael\ Cardoso Mark\ Carlson)
  s.require_paths     = %w(lib)

  s.add_dependency    'refinerycms', '~> 1.0.3'
  s.add_dependency    'paperclip'

  s.files             = [
    'app',
    'app/controllers',
    'app/controllers/admin',
    'app/controllers/admin/jobs_controller.rb',
    'app/controllers/job_applications_controller.rb',
    'app/controllers/jobs_controller.rb',
    'app/models',
    'app/models/job.rb',
    'app/models/job_application.rb',
    'app/models/job_mailer.rb',
    'app/views',
    'app/views/admin',
    'app/views/admin/job_applications',
    'app/views/admin/job_applications/_job.html.erb',
    'app/views/admin/job_applications/_sortable_list.html.erb',
    'app/views/admin/jobs',
    'app/views/admin/jobs/_form.html.erb',
    'app/views/admin/jobs/_job.html.erb',
    'app/views/admin/jobs/_job_application.html.erb',
    'app/views/admin/jobs/_sortable_list.html.erb',
    'app/views/admin/jobs/edit.html.erb',
    'app/views/admin/jobs/index.html.erb',
    'app/views/admin/jobs/job_applications.html.erb',
    'app/views/admin/jobs/new.html.erb',
    'app/views/job_applications',
    'app/views/job_applications/_form.html.erb',
    'app/views/job_applications/new.html.erb',
    'app/views/job_applications/show.html.erb',
    'app/views/job_mailer',
    'app/views/job_mailer/notification.html.erb',
    'app/views/jobs',
    'app/views/jobs/index.html.erb',
    'app/views/jobs/show.html.erb',
    'config',
    'config/locales',
    'config/locales/en.yml',
    'config/routes.rb',
    'lib',
    'lib/gemspec.rb',
    'lib/generators',
    'lib/generators/refinerycms_jobs',
    'lib/generators/refinerycms_jobs/refinerycms_jobs_generator.rb',
    'lib/generators/refinerycms_jobs/templates',
    'lib/generators/refinerycms_jobs/templates/db',
    'lib/generators/refinerycms_jobs/templates/db/migrate',
    'lib/generators/refinerycms_jobs/templates/db/migrate/migration_number_create_singular_name.rb',
    'lib/generators/refinerycms_jobs/templates/db/seeds',
    'lib/generators/refinerycms_jobs/templates/db/seeds/seed.rb',
    'lib/jobs.rb',
    'lib/refinerycms-jobs.rb',
    'readme.md'
  ]
  
end
