describe "Search" do
  let :connection do
    double(:connection, get: nil)
  end

  let :la_search_response do
    File.read(File.expand_path("spec/responses/la_search_response.json"))
  end

  let :invalid_search_response do
    File.read(File.expand_path("spec/responses/invalid_key_response.json"))
  end

  before :each do
    ParkWhiz.api_key = 'asdf1234'
  end

  context "on successful search" do
    it "should return an array of ParkWhiz::Locations" do
      expect(connection).to receive(:get) { double( body: JSON.parse(la_search_response) ) }
      ParkWhiz.connection = connection
      locations = ParkWhiz.search({})
      expect(locations).to be_kind_of(Array)
      expect(locations.first).to be_kind_of(ParkWhiz::Location)
    end
  end

  context 'on error' do
    it "should raise a ParkWhiz::SearchError" do
      expect(connection).to receive(:get) { double( body: JSON.parse(invalid_search_response) ) }
      ParkWhiz.connection = connection
      expect do
        ParkWhiz.search({})
      end.to raise_error(ParkWhiz::SearchError)
    end
  end
end