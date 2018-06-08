RSpec.describe FronkinBandcampScraper::Scraper do
  context 'with a Bandcamp release URL' do
    let(:url) { 'https://piglet.bandcamp.com/album/lava-land' }
    let(:scraper) { FronkinBandcampScraper::Scraper.new(url) }

    context 'for a release' do
      it 'scrapes the title' do
        expect(scraper.release.title).to eq 'lava land'
      end

      it 'scrapes the date' do
        expect(scraper.release.date).to eq '20050101'
      end

      it 'scrapes the cover' do
        expect(scraper.release.cover).to eq 'https://f4.bcbits.com/img/a0461781564_10.jpg'
      end
    end

    context 'for an artist' do
      it 'scrapes the name' do
        expect(scraper.artist.name).to eq 'piglet'
      end

      it 'scrapes the photo' do
        expect(scraper.artist.photo).to eq 'https://f4.bcbits.com/img/0003586442_10.jpg'
      end

      it 'scrapes the location' do
        expect(scraper.artist.location).to eq 'Chicago, Illinois'
      end
    end
  end
end
