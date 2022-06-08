
require 'open-uri'

class MeteoApiService


  def initialize(city)
    @url = "http://api.weatherstack.com/forecast?access_key=#{ENV.fetch("WEATHER_KEY")}&query=#{city}"
  end

  def call
    body = URI.open(@url).read
    json = JSON.parse(body)
    weather = json["current"]["weather_descriptions"][0]
  end


end
