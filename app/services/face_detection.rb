require 'uri'
require 'net/http'
require 'openssl'
require 'json'


class FaceDetection

  def self.detect(photo1, photo2)
    url = URI("https://face-verification2.p.rapidapi.com/faceverification")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["content-type"] = 'application/x-www-form-urlencoded'
    request["x-rapidapi-key"] = '61a3cab27bmsh821e3c62b747becp15c0f8jsn57b7809f20f8'
    request["x-rapidapi-host"] = 'face-verification2.p.rapidapi.com'
    request.body = "linkFile1=#{photo1}&linkFile2=#{photo2}"

    response = http.request(request)
    json = JSON.parse(response.read_body)
    json["data"]["resultMessage"]
  end

end
