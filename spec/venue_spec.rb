describe "Venue" do
  let :connection do
    double(:connection, get: nil)
  end

  let :venue_search_response do
    File.read(File.expand_path("spec/responses/venue_search_response.json"))
  end

  let :invalid_search_response do
    File.read(File.expand_path("spec/responses/invalid_key_response.json"))
  end

  describe "search" do
    it "should return an Array of Parkwhiz::Venues" do
      Parkwhiz.connection = connection
      expect(connection).to receive(:get) { double( body: JSON.parse(venue_search_response) ) }
      venues = Parkwhiz::Venue.search({})
      expect(venues).to be_kind_of(Array)
      expect(venues.first).to be_kind_of(Parkwhiz::Venue)
    end

    it "should raise a search error if bad search response" do
      expect(connection).to receive(:get) { double( body: JSON.parse(invalid_search_response) ) }
      Parkwhiz.connection = connection
      expect do
        Parkwhiz.search({})
      end.to raise_error(Parkwhiz::SearchError)
    end
  end
end