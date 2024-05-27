# config/application.rb
module Icare
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Configuración de CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # Cambia '*' por el dominio específico si es necesario
        resource '*',
          headers: :any,
          methods: [:get, :post, :options, :delete, :put],
          expose: ['Authorization'],
          max_age: 600
      end
    end

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}').to_s]
    config.i18n.enforce_available_locales = false
    config.i18n.default_locale = :'en-US'
    config.i18n.available_locales = %i[en-US it-IT]

    config.active_job.queue_adapter = :sucker_punch
  end
end
