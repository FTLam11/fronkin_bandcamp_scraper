RSpec.describe FronkinBandcamp::Scraper do
  context 'with a Bandcamp release URL' do
    let(:url) { 'https://doncaballero.bandcamp.com/album/what-burns-never-returns' }
    let(:scraper) { FronkinBandcamp::Scraper.new(url) }

    context 'for a release' do
      subject(:release) { scraper.release }

      it 'scrapes the title' do
        expect(release.title).to eq 'What Burns Never Returns'
      end

      it 'scrapes the date' do
        expect(release.date).to eq '6/9/1998'
      end

      it 'scrapes the cover' do
        expect(release.cover).to eq 'https://f4.bcbits.com/img/a0238936032_10.jpg'
      end

      it 'scrapes the formats' do
        expect(release.formats).not_to be_empty
      end

      it 'scrapes the description' do
        expect(release.description).to be_empty
      end

      it 'scrapes the credits' do
        expect(release.credits).to be_empty
      end

      it 'scrapes the album ID' do
        expect(release.bandcamp_album_id).to eq '3437957695'
      end

      it 'scrapes the release ID' do
        expect(release.release_id).to be_nil
      end

      subject(:tracks) { release.tracks }

      it 'scrapes the track numbers' do
        expect(tracks.map(&:number)).to eq (1..8).to_a
      end

      it 'scrapes the track titles' do
        expect(tracks.map(&:title)).to contain_exactly(
          "Don Caballero 3",
          "In the Absence of Strong Evidence to the Contrary, One May Step Out of the Way of the Charging Bull",
          "Delivering the Groceries at 138 Beats per Minute",
          "Slice Where You Live Like Pie",
          "Room Temperature Suite",
          "The World in Perforated Lines",
          "From the Desk of Elsewhere Go",
          "June Is Finally Here"
        )
      end

      it 'scrapes the track durations' do
        expect(tracks.map(&:duration)).to contain_exactly(
          "09:42", "04:35", "05:49", "05:09", "05:31", "03:52", "07:51", "04:56"
        )
      end

      it 'scrapes the tags' do
        expect(release.tags).to contain_exactly(
          "alternative rock",
          "instrumental",
          "metal",
          "experimental",
          "instrumental",
          "math rock",
          "post-rock",
          "progressive rock",
          "Pittsburgh"
        )
      end
    end

    context 'for an artist' do
      it 'scrapes the name' do
        expect(scraper.artist.name).to eq 'Don Caballero'
      end

      it 'scrapes the photo' do
        expect(scraper.artist.photo).to eq 'https://f4.bcbits.com/img/0000083964_10.jpg'
      end

      it 'scrapes the location' do
        expect(scraper.artist.location).to eq 'Pittsburgh, Pennsylvania'
      end
    end
  end
end
