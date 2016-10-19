require 'rails_helper'

feature "Search", :js => :true do
  describe "search for a song by keyword" do
    it "displays a table of all songs matching the keyword" do
      visit '/'
      fill_in "search[song][term]", with: 'Sorry'
      find('#searchTitle').send_keys(:enter)
      expect(page).to have_content('1 Sorry')
    end
  end
end