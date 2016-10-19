require 'rails_helper'

describe Album do  
  context 'associations' do 
    it "belongs to an artist" do
      expect(Album.reflect_on_association(:artist).macro).to eq :belongs_to
      expect(Album.column_names).to include "artist_id"
    end

    it "has many songs" do
      expect(Album.reflect_on_association(:songs).macro).to eq :has_many
    end
  end
end
