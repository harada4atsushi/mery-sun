require 'twilio-ruby'

class TwilioCaller
  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def call(tel)
    tel_to = tel.gsub(/\A0/,'+81')

    @call = @client.account.calls.create(
      :from => ENV['CALL_FROM'],
      :to => tel_to,
      :method => 'GET',
      :url => 'https://mery-san.herokuapp.com/mery.xml'
    )
  end
end
