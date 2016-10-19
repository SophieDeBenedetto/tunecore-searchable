require 'rails_helper'

describe Artist do
  
  context 'associations' do 
    it "has many songs" do
      expect(Artist.reflect_on_association(:songs).macro).to eq :has_many
    end

    it "has many albums" do
      expect(Artist.reflect_on_association(:albums).macro).to eq :has_many
    end
  end
end
