require 'rails_helper'

feature "Search", :js => :true do
  describe "search for a song by title" do
    it "displays a table of all songs matching the title" do
      visit '/'
      fill_in "search[song][term]", with: 'Sorry'
      find('#searchTitle').send_keys(:enter)
      expect(page).to have_content('1 Sorry')
      expect(page).to have_content('2 Sorry')
    end
  end

  describe "search for songs by artist name" do
    it "displays a table of all songs by the artist with the given title" do
      visit '/'
      fill_in "search[artist][term]", with: 'Beyonce'
      find('#searchTitle').send_keys(:enter)
      expect(page).to have_content('1 Sorry')
      expect(page).to have_content('2 Hold Up')
      expect(page).to have_content('3 All Night')
    end
  end

  describe "search for songs by album title" do
    it "displays a table of all songs from the album with the given title" do
      visit '/'
      fill_in "search[album][term]", with: 'Lemonade'
      find('#searchTitle').send_keys(:enter)
      expect(page).to have_content('1 Sorry')
      expect(page).to have_content('2 Hold Up')
      expect(page).to have_content('3 All Night')
    end
  end

  describe "search for songs by title and artist name" do
    it "displays a table of all songs from with the given title, by the artist with the given name" do
      visit '/'
      fill_in "search[song][term]", with: 'Sorry'
      fill_in "search[artist][term]", with: 'Justin Beiber'
      find('#searchTitle').send_keys(:enter)
      expect(page).to have_content('1 Sorry Justin Beiber')
    end
  end

  describe "search for songs by title and album title" do
    it "displays a table of all songs with the given title, from the album with the given album title" do
      visit '/'
      fill_in "search[song][term]", with: 'Sorry'
      fill_in "search[album][term]", with: 'Purpose'
      find('#searchTitle').send_keys(:enter)
      expect(page).to have_content('1 Sorry Justin Beiber')
    end
  end

  describe "search for songs by artist name and album title" do
    it 'dipslays a table of all songs by the given artist, from the given album' do 
      visit '/'
      fill_in "search[artist][term]", with: 'Adele'
      fill_in "search[album][term]", with: 'Hello'
      find('#searchTitle').send_keys(:enter)
      expect(page).to have_content('1 Hello Adele Hello 2 Love Adele Hello 3 Hold You Adele Hello')
    end
  end

  describe "search for songs by title, artist name and album title" do
    it 'dipslays a table of all songs with the given name, by the given artist, from the given album' do 
      visit '/'
      fill_in "search[song][term]", with: 'Sorry'
      fill_in "search[artist][term]", with: 'Beyonce'
      fill_in "search[album][term]", with: 'Lemonade'
      find('#searchTitle').send_keys(:enter)
      expect(page).to have_content('1 Sorry Beyonce')
    end
  end

  describe "search for songs by keyword" do
    it 'dipslays a table of all songs with a title, or artist name or ablum title like the given keyword' do 
      visit '/'
      fill_in "search[all][term]", with: 'Hold'
      find('#searchTitle').send_keys(:enter)
      expect(page).to have_content('1 Hold Up Beyonce Lemonade 2 Hold You Adele Hello')
    end
  end

end
