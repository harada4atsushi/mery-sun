require 'sinatra'
require './lib/twilio_caller'
require 'dotenv'

Dotenv.load

get '/' do
  erb :index
end

get '/call' do
  if params[:tel_number]
    TwilioCaller.new.call(params[:tel_number])
  end
end
