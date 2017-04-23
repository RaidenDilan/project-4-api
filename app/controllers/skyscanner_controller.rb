require 'date'

class SkyscannerController < ApplicationController

  def flights
    outbound = params[:departDate].split('T').first
    inbound = params[:returnDate].split('T').first

    base_url = 'http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/UK/GBP/en-GB/'

    response = HTTParty.get("#{base_url}#{params[:origin]}/#{params[:destination]}/#{outbound}/#{inbound}", {
      query: {
        apiKey: ENV["SKYSCANNER_API_KEY"],
      },
      headers: { 'Accept' => 'application/json' }
    })

    p response

    render json: response, status: :ok
  end
end
