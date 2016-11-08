# Scanii

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/scanii`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scanii'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scanii




#### Configuration
```ruby

# Initialize Scanii (set defaults):
Scanii.configure do |config|
  config.api_key = 'your_api_key'
  config.api_secret = 'your_api_secret'
end

@scanii = Scanii.new


# Initialize Scanii (custom for each object):
@scanii = Scanii.new(api_key: 'your_api_key', api_secret: 'your_api_secret')
```

## Usage
#### Scan files
```ruby
@scanii.scan(file)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nathanbrakken/scanii. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

