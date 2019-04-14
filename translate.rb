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

set :bind, '0.0.0.0'
set :port, ENV['PORT'] || 80

get '/' do
  query = params['query'].to_s || ''
  translation = translate.translate query, to: "en"
  translation.text
end