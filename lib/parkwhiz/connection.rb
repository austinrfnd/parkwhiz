module ParkWhiz
  def self.connection=(connection)
    @connection = connection
  end

  def self.connection
    @connection ||= Faraday.new(url: 'http://api.parkwhiz.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.response :json
    end
  end
end