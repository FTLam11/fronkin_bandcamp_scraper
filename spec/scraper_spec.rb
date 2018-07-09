RSpec.describe FronkinBandcamp::Scraper do
  context 'with a Bandcamp release URL' do
    let(:url) { 'https://piglet.bandcamp.com/album/lava-land' }
    let(:scraper) { FronkinBandcamp::Scraper.new(url) }

    context 'for a release' do
      subject(:release) { scraper.release }

      it 'scrapes the title' do
        expect(release.title).to eq 'lava land'
      end

      it 'scrapes the date' do
        expect(release.date).to eq '20050101'
      end

      it 'scrapes the cover' do
        expect(release.cover).to eq 'https://f4.bcbits.com/img/a0461781564_10.jpg'
      end

      it 'scrapes the formats' do
        expect(release.formats).not_to be_empty
      end

      subject(:tracks) { release.tracks }

      it 'scrapes the track numbers' do
        expect(tracks.map(&:number)).to eq (1..6).to_a
      end

      it 'scrapes the track titles' do
        expect(tracks.map(&:title)).to include 'bug stomp'
      end

      it 'scrapes the track durations' do
        bug_stomp = tracks.first
        expect(bug_stomp.duration).to eq '03:36'
      end

      it 'scrapes the tags' do
        expect(release.tags).to include 'math rock'
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
