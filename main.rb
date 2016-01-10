require 'sinatra'
require './lib/twilio_caller'
require 'dotenv'

Dotenv.load

get '/' do
  erb :index
end

get '/call' do
  TwilioCaller.new.call(params[:tel_number]) if params[:tel_number]
end
