require 'bundler'
Bundler.require

require 'dotenv'
Dotenv.load

require "google/cloud/translate"

Google::Cloud::Translate.configure do |config|
  config.project_id  = ENV['PROJECT_ID']
  config.credentials = "./credentials.json"
end

translate = Google::Cloud::Translate.new

translation = translate.translate "こんにちは。私は今、カフェにいます", to: "en"

pp translation.text