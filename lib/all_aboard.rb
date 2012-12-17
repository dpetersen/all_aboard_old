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
end
