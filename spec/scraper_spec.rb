RSpec.describe FronkinBandcampScraper::Scraper do
  it 'scrapes Bandcamp album URLs' do
    url = 'https://piglet.bandcamp.com/album/lava-land'
    scraper = FronkinBandcampScraper::Scraper.new(url)
    expect(scraper.doc.class).to be Nokogiri::HTML::Document
  end
end
