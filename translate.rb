require 'bundler'
Bundler.require

require 'dotenv'
Dotenv.load

require "google/cloud/translate"
require 'sinatra'

Google::Cloud::Translate.configure do |config|
  config.project_id  = ENV['PROJECT_ID']
  config.credentials = "./credentials.json"
end

translate = Google::Cloud::Translate.new

translation = translate.translate "こんにちは。私は今、カフェにいます", to: "en"

pp translation.text

set :bind, '0.0.0.0'

get '/' do
  target = ENV['TARGET'] || 'World'
  "Hello #{target}!\n"
end