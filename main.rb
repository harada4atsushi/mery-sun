require 'sinatra'
require './lib/twilio_caller'
require 'dotenv'

Dotenv.load

get '/' do
  logger.info "index-----------------------------"
  erb :index
end

get '/call' do
  logger.info "call-----------------------------"
  TwilioCaller.new.call(params[:tel_number]) if params[:tel_number]
end

get '/status_callback' do
  logger.info "-----------------------"
  logger.info params

  puts '----------------------------------------------'
  puts 'status_callback'
  puts params
end
