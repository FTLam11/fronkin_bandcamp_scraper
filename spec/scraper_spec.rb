RSpec.describe FronkinBandcampScraper::Scraper do
  context 'with a Bandcamp release URL' do
    let(:url) { 'https://piglet.bandcamp.com/album/lava-land' }
    let(:scraper) { FronkinBandcampScraper::Scraper.new(url) }

    it 'scrapes the release title' do
      expect(scraper.release_title).to eq 'lava land'
    end

    it 'scrapes the artist name' do
      expect(scraper.artist_name).to eq 'piglet'
    end
  end
end
