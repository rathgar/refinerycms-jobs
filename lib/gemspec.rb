#!/usr/bin/env ruby
require File.expand_path('../jobs.rb', __FILE__)
version = ::Refinery::Jobs.version
raise "Could not get version so gemspec can not be built" if version.nil?
files = Dir.glob("**/*").flatten.reject do |file|
  file =~ /\.gem(spec)?$/
end

gemspec = <<EOF
Gem::Specification.new do |s|
  s.name              = %q{refinerycms-jobs}
  s.version           = %q{#{version}}
  s.description       = %q{A really straightforward open source Ruby on Rails jobs engine designed for integration with RefineryCMS.}
  s.date              = %q{#{Time.now.strftime('%Y-%m-%d')}}
  s.summary           = %q{Ruby on Rails jobs engine for RefineryCMS.}
  s.authors           = %w(Jim\\ Croft Rafael\\ Cardoso)
  s.require_paths     = %w(lib)

  s.add_dependency    'refinerycms', '~> 0.9.8'
  s.add_dependency    'paperclip'

  s.files             = [
    '#{files.join("',\n    '")}'
  ]
  #{"s.test_files        = [
    '#{Dir.glob("test/**/*.rb").join("',\n    '")}'
  ]" if File.directory?("test")}
end
EOF

File.open(File.expand_path("../../refinerycms-jobs.gemspec", __FILE__), 'w').puts(gemspec)