module Parkwhiz
  class Location
    include Virtus.model
    attribute :name, String
    attribute :location_name, String
    attribute :location_id, Integer
    attribute :listing_id, Integer
    attribute :parkwhiz_url, String
    attribute :api_url, String
    attribute :address, String
    attribute :city, String
    attribute :state, String
    attribute :zip, String
    attribute :lat, Float
    attribute :lng, Float
    attribute :distance, Integer
    attribute :recommendations, Integer
    attribute :reservation, Integer
    attribute :eticket, Boolean
    attribute :valet, Boolean
    attribute :indoor, Boolean
    attribute :shuttle, Boolean
    attribute :tailgate, Boolean
    attribute :security, Boolean
    attribute :restroom, Boolean
    attribute :attended, Boolean
    attribute :rv, Boolean
    attribute :available_spots, Integer
    attribute :price, Float
    attribute :www_reserve_url, String
    attribute :api_reserve_url, String
  end
end