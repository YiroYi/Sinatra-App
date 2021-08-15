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
 'Hello Stripe World'
end
