require 'net/http'

class Telegram
  def send(chat_service, message)
    url = parse_url(chat_service.chat, message)
    result = Net::HTTP.get(url)
  end

  private

    def parse_url(chat_service, message)
      URI.parse("https://api.telegram.org/#{chat.bot_token}/sendMessage?text=#{message}&chat_id=#{chat.chat_id}&parse_mode=Markdown")
    end


end
