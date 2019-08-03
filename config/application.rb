require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ar2019Gacha
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    CHARACTER_LIST = [
      'MINATO YUKINA',"IMAI LISA","HIKAWA SAYO","UDAGAWA AKO","SHIROKANE RINKO",
      'TOYAMA KASUMI ','HANAZONO TAE', 'USHIGOME RIMI ','YAMABUKI SAYA ','ICHIGAYA ARISA ',
      'MITAKE RAN ','AOBA MOCA ','UDAGAWA TOMOE ','UEHARA HIMARI ','HAZAWA TSUGUMI ',
      'MARUYAMA AYA ','HIKAWA HINA ','SHIRASAGI CHISATO ','YAMATO MAYA ','WAKAMIYA EVE ',
      'TSURUMAKI KOKORO ','SETA KAORU ','MATSUBARA KANON ','KITAZAWA HAGUMI ','OKUSAWA MISAKI ',
    ]
    config.character_list = CHARACTER_LIST
  end
end
