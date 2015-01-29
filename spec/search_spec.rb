describe "Search" do
  let :connection do
    double(:connection, get: nil)
  end

  let :la_search_response do
    File.read(File.expand_path("spec/responses/la_search_response.json"))
  end

  let :no_location_search_response do
    File.read(File.expand_path("spec/responses/no_location_response.json"))
  end

  let :invalid_search_response do
    File.read(File.expand_path("spec/responses/invalid_key_response.json"))
  end

  before :each do
    Parkwhiz.api_key = 'asdf1234'
  end

  context 'on empty search results' do
    it "should return an emtpy Array" do
      expect(connection).to receive(:get) { double( body: JSON.parse(no_location_search_response) ) }
      Parkwhiz.connection = connection
      locations = Parkwhiz.search({})
      expect(locations).to be_kind_of(Array)
      expect(locations).to be_empty

    end
  end
  context "on successful search" do
    it "should return an array of Parkwhiz::Locations" do
      expect(connection).to receive(:get) { double( body: JSON.parse(la_search_response) ) }
      Parkwhiz.connection = connection
      locations = Parkwhiz.search({})
      expect(locations).to be_kind_of(Array)
      expect(locations.first).to be_kind_of(Parkwhiz::Location)
    end
  end

  context 'on error' do
    it "should raise a Parkwhiz::SearchError" do
      expect(connection).to receive(:get) { double( body: JSON.parse(invalid_search_response) ) }
      Parkwhiz.connection = connection
      expect do
        Parkwhiz.search({})
      end.to raise_error(Parkwhiz::SearchError)
    end
  end
end