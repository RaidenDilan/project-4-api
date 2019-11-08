require 'date'

class SkyscannerController < ApplicationController

  # SKYSCANNER API REQUEST
  def flights

    # outbound = params[:outboundpartialdate].split('T').first
    # inbound = params[:inboundpartialdate].split('T').first
    # outbound = params[:outboundpartialdate]
    # inbound = params[:inboundpartialdate]

    # pp 'outbound', outbound
    # pp 'inbound', inbound

    # country = params[:country]
    # locale = params[:locale]
    # currency = params[:currency]
    # origin = params[:origin]
    # destination = params[:destination]

    country = "UK"
    locale = "en-GB"
    currency = "GBP"

    # base_url = "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/UK/GBP/en-GB/"
    base_url = "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/#{country}/#{currency}/#{locale}/"
    # base_url = "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/UK/GBP/en-GB/LHR-sky/BCN-sky/2019-12-01?outboundpartialdate=2019-12-01?inboundpartialdate=2019-12-01"
    # base_url = 'https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/{country}/{currency}/{locale}/{originplace}/{destinationplace}/{outboundpartialdate}'

    response = HTTParty.get("#{base_url}#{params[:origin]}/#{params[:destination]}/#{params[:outboundpartialdate]}/#{params[:inboundpartialdate]}/", {
      headers: {
        'Accept' => 'application/json',
        'X-RapidAPI-Key' => ENV['RAPIDAPI_API_KEY']
      }
    })
    # p "RESPONSE ---===---===--->>", response

    render json: response, status: :ok
  end
end
