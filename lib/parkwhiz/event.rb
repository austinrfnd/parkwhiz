module Parkwhiz
  class Event
    include Virtus.model
    
    attribute :event_name, String
    attribute :start, Integer
    attribute :end, Integer
    attribute :parkwhiz_url, String
    attribute :venue_name, String
    attribute :lat, Float
    attribute :lng, Float
    attribute :min_price, Float
    attribute :max_price, Float
    attribute :min_distance, Integer
    attribute :max_distance, Integer
    attribute :amenities, Hash
    attribute :parking_listings, Array[Location]

    def self.search(search_parameters)
      response = Parkwhiz.connection.get do |request|
        request.url SEARCH_PATH
        request.params['key'] = Parkwhiz.api_key
        request.params.merge!(search_parameters)
      end

      raise SearchError.new(response.body['error']) if response.body.kind_of?(Hash) && response.body['error']

      response.body.collect{|event_json| self.new(event_json)}
    end
  end
end
