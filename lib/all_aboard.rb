require 'inherited_resources'
require 'coffee-rails'
require 'haml'
require 'sass'
require 'neat'
require 'simple_form'
require 'sidekiq'
require 'redis'
require 'redis-namespace'
require 'ember-rails'

require "all_aboard/engine"

module AllAboard
  def self.redis
    @redis
  end

  def self.redis=(redis)
    @redis = redis
  end

  def self.source_templates
    @source_templates ||= []
    @source_templates
  end

  def self.add_source_template(path, filesystem_path)
    source_templates << [ path, filesystem_path ]
  end
end
