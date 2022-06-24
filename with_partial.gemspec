# frozen_string_literal: true

require_relative 'lib/with_partial/version'

Gem::Specification.new do |spec|
  spec.name        = 'with_partial'
  spec.version     = WithPartial::VERSION
  spec.authors     = ['Aaric Pittman']
  spec.email       = ['aaricpittman@gmail.com']
  spec.homepage    = 'https://github.com/aaricpittman/with_partial'
  spec.summary     = 'Allows your to specify the martial when rendering a model.'
  spec.description = spec.summary
  spec.license     = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir['{app,config,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 6.1'

  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'solargraph'
end
