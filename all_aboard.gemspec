$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "all_aboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "all_aboard"
  s.version     = AllAboard::VERSION
  s.authors     = ["Don Petersen"]
  s.email       = ["don@donpetersen.net"]
  s.homepage    = "donpetersen.net"
  s.summary     = "A modular status board as a Rails Engine"
  s.description = "A modular status board as a Rails Engine."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  s.add_dependency 'jquery-rails'
  s.add_dependency 'inherited_resources'
  s.add_dependency 'haml'
  s.add_dependency 'simple_form'
  s.add_dependency 'sidekiq'
  s.add_dependency 'redis'
  s.add_dependency 'redis-namespace'
  s.add_dependency 'ember-rails'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'spin'
  s.add_development_dependency 'kicker'
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'thin'
  s.add_development_dependency 'fakeredis'
end
