require 'sinatra'
require './lib/twilio_caller'
require 'dotenv'

Dotenv.load

get '/' do
  #TwilioCaller.new.call
  erb :index
end
