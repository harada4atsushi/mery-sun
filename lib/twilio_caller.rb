require 'twilio-ruby'

class TwilioCaller
  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def call
    @call = @client.account.calls.create(
      :from => ENV['CALL_FROM'],
      :to => ENV['CALL_TO'],
      :url => 'http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient'
    )
  end
end
