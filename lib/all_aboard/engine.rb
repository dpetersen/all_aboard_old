module AllAboard
  class Engine < ::Rails::Engine
    config.autoload_paths << File.join(File.dirname(__FILE__), "..", "..", "lib")

    isolate_namespace AllAboard

    initializer "redis connection" do
      AllAboard.redis = Redis.new
    end
  end
end
