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

    status = ''

    loop do
      call = @client.account.calls.get(@call.sid)
      puts "call status #{call.status}"
      status = call.status

      case call.status
      when 'no-answer', 'completed'
        sleep(1)
        break
      when 'in-progress', 'failed', 'canceled', 'busy'
        break
      when 'queued','ringing'
        sleep(0.5)
      end
    end
    status
  end
end
