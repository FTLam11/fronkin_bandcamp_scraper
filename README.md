# FronkinBandcamp

Maybe you thought you'd flop your way to a championship.

Maybe you blame the refs for blowing calls.

Maybe you assumed this was the year.

**BALL DON'T LIE**

This is a simple webscraper for bandcamp. Read through the entire README
before you try anything, thanks!

## I. Installation

Add this line to your application's Gemfile:

```ruby
gem 'fronkin_bandcamp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fronkin_bandcamp

## II. Usage

### Initialization

Given a bandcamp release URL, initialize a `Scraper` object like so:

```ruby
url = 'https://clevergirl.bandcamp.com/album/no-drum-and-bass-in-the-jazz-room'
scraper = FronkinBandcamp::Scraper.new(url)
```

A `FronkingBandcamp::Scraper` has two public methods `#artist`
and `#release`, each with their own attributes.

### Artist

```ruby
scraper.artist.name # Clever Girl
scraper.artist.location # London, UK
scraper.artist.photo # Artist photo
```

### Release

```ruby
scraper.release.title # No Drum and Bass in the Jazz Room
scraper.release.date # 20140423
scraper.release.cover # Release cover
scraper.release.tracks

[
    [0] #<Struct:FronkinBandcamp::Track:0x7fe59082b158
        duration = "05:28",
        number = 1,
        title = "Elm"
    >,
    [1] #<Struct:FronkinBandcamp::Track:0x7fe59082b0e0
        duration = "06:09",
        number = 2,
        title = "ohmygodiloveyoupleasedontleaveme"
    >,
    [2] #<Struct:FronkinBandcamp::Track:0x7fe59082b0b8
        duration = "05:07",
        number = 3,
        title = "Sleepyhead Symphony"
    >,
    [3] #<Struct:FronkinBandcamp::Track:0x7fe59082b040
        duration = "05:28",
        number = 4,
        title = "Teleblister"
    >
]

scraper.release.tags # ["world", "London"]

scraper.release.formats

[
    [0] #<FronkinBandcamp::Format:0x007f864913c500 @name="Subcription",
@product="Streaming + Download", @description=nil, @product_images=[],
@price="Buy Digital Album   $5 USD  or more", @is_available=true>
]
```

## III. Miscellaneous

### Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Contributing


Is something broken? Does this README need to be updated? Open an issue,
or even better, help me fix my shit! Suggestions and improvements are
welcome!

Bug reports and pull requests are welcome on GitHub at https://github.com/FTLam11/fronkin_bandcamp_scraper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

### License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

### Code of Conduct

Everyone interacting in the FronkinBandcampScraper project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/FTLam11/fronkin_bandcamp_scraper/blob/master/CODE_OF_CONDUCT.md).
