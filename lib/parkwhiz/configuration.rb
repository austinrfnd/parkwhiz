module ParkWhiz
  def self.configure
    yield self
  end

  def self.api_key=(api_key)
    @@api_key = api_key
  end

  def self.api_key
    @@api_key
  end
end