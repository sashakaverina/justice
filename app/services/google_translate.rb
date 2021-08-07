require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class GoogleTranslate

  def self.translate(incident)
    url = URI("https://google-translate20.p.rapidapi.com/translate")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["content-type"] = 'application/x-www-form-urlencoded'
    request["x-rapidapi-key"] = ENV['API_KEY']
    request["x-rapidapi-host"] = 'google-translate20.p.rapidapi.com'
    request.body = "text=#{incident.description}&tl=ja&sl=en"

    response = http.request(request)
    json = JSON.parse(response.read_body)
    json["data"]["translation"]
  end

end
