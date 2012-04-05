module AllAboard
  class Engine < ::Rails::Engine
    config.autoload_paths << File.join(File.dirname(__FILE__), "..", "..", "lib")

    isolate_namespace AllAboard

    initializer "redis connection" do
      AllAboard.redis = Redis.new
    end

    initializer "require and register layouts" do
      require File.join(Engine.root, "app", "layouts", "all_aboard", "quarters", "quarters")
    end
  end
end
