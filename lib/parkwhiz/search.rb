module Parkwhiz

  SEARCH_PATH = "/search/"

  # Search
  #
  # Returns:
  # Array of ParkWhiz::Location
  #
  # Endpoint: http://www.parkwhiz.com/developers/search/
  #
  def self.search(search_parameters)
    response = connection.get do |request|
      request.url SEARCH_PATH
      request.params['key'] = api_key
      request.params.merge!(search_parameters)
    end

    raise SearchError.new(response.body['error']) if response.body.kind_of?(Hash) && response.body['error']

    response.body['parking_listings'].collect{|parking_listing_json| Location.new(parking_listing_json)}
  end
end