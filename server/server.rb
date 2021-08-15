require 'stripe'
require 'dotenv'
require 'sinatra'

Dotenv.load('../.env')
Stripe.api_key = ENV['STRIPE_SECRET_KEY']

set :static, true #serve static assets as HTML
#set :public_folder, "../client" #set assets from this directory
set :public_folder, File.join(File.dirname(__FILE__), ENV["STATIC_DIR"])
set :port, 4242

get '/' do
  content_type "text/html"
  send_file File.join(settings.public_folder, 'index.html')
end

get '/public-keys' do
  content_type "application/json"
  { key: ENV['STRIPE_PUBLISH_KEY'] }.to_json
end

post '/my-post-route' do
  data = JSON.parse(request.body.read, symbolize_names: true)
  puts "POST with #{data.to_json} to /my-post-route"

  data.to_json
end
