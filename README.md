# Parkwhiz

A gem wrapper to Parkwhiz API.

## Installation

Add this line to your application's Gemfile:

    gem 'parkwhiz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install parkwhiz

## Usage

```ruby

# Set your api key
Parkwhiz.api_key = "my api key"

locations = Parkwhiz.search({destination: '1 World Way, Los Angeles, CA 90045'})
# Array of ParkwhizLocations
```
## Run Specs

```
rake
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/parkwhiz/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
