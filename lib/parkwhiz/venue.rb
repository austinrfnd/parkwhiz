module Parkwhiz
  class Venue
    include Virtus.model

    attribute :name, String
    attribute :address, String
    attribute :city, String
    attribute :state, String
    attribute :zip, String
    attribute :url_fragment, String
    attribute :distance, Integer
    attribute :relevancy, Integer

    SEARCH_PATH = "/venue/search/"

    def self.search(search_parameters)
      response = Parkwhiz.connection.get do |request|
        request.url SEARCH_PATH
        request.params['key'] = Parkwhiz.api_key
        request.params.merge!(search_parameters)
      end

      raise SearchError.new(response.body['error']) if response.body.kind_of?(Hash) && response.body['error']

      response.body.collect{|venue_json| self.new(venue_json)}
    end
  end
end