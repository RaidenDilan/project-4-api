require 'date' # Can use new Date() to get flights

class SkyscannerController < ApplicationController
  # SKYSCANNER API REQUEST
  def flights

    # outbound = params[:outboundpartialdate].split('T').first
    # inbound  = params[:inboundpartialdate].split('T').first
    # outbound = params[:outboundpartialdate]
    # inbound  = params[:inboundpartialdate]

    # country     = params[:country]
    # locale      = params[:locale]
    # currency    = params[:currency]
    # origin      = params[:origin]
    # destination = params[:destination]

    country  = "UK"
    locale   = "en-GB"
    currency = "GBP"

    base_url = "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/#{country}/#{currency}/#{locale}/"

    response = HTTParty.get("#{base_url}#{params[:origin]}/#{params[:destination]}/#{params[:outboundpartialdate]}/#{params[:inboundpartialdate]}/", {
      headers: {
        'Accept' => 'application/json',
        'X-RapidAPI-Key' => ENV['RAPIDAPI_API_KEY']
      }
    })
    render json: response, status: :ok
  end
end
