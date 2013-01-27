module AllAboard
  class Engine < ::Rails::Engine
    config.autoload_paths << File.join(File.dirname(__FILE__), "..", "..", "lib")

    # Hstore doesn't work any other way.  Manifests itself as a failure in
    # db:test:prepare.
    config.active_record.schema_format = :sql

    isolate_namespace AllAboard

    initializer "configure ember-rails", before: "ember_rails.setup_vendor" do
      variant = Rails.env.production? ? :production : :development
      config.ember.variant = variant

      config.handlebars.templates_root = "all_aboard/templates"
    end
  end
end
