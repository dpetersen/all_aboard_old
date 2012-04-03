require 'inherited_resources'
require 'haml'
require 'simple_form'
require 'sidekiq'
require 'redis'
require 'redis-namespace'

require "all_aboard/engine"

module AllAboard
  def self.redis
    @redis
  end

  def self.redis=(redis)
    @redis = redis
  end
end
