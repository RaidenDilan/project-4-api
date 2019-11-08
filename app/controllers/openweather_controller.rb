require 'date'

class OpenWeatherController < ApplicationController

  def forecast

    city = params[:city];
    country_code = params[:country_code];

    query = "#{city},#{country_code}"

    # query = URI.encode("#{city},#{country_code}")
    # request_api("https://community-open-weather-map.p.rapidapi.com/forecast?q=#{query}")

    base_url = "http://api.openweathermap.org/data/2.5/weather/"
    # apiKey = env['dd56a1f60b8665189166c08496156d57']

    response = HTTParty.get("#{base_url}#{query}&appid=dd56a1f60b8665189166c08496156d57", {
      # query: {
      #   key: env['OPENWEATHER_API_KEY']
      # },
      headers: {
        'Accept' => 'application/json'
        # 'X-RapidAPI-Key' => ENV['OPENWEATHER_API_KEY']
        # 'X-RapidAPI-Key' => 'dd56a1f60b8665189166c08496156d57'
      }
    })

    # p "RESPONSE ---===---===--->>", response

    render json: response, status: :ok
  end
end
