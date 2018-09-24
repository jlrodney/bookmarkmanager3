feature 'index_page' do
  scenario 'should have title of bookmarks' do
    visit('/')
    expect(page).to have_content "Bookmarks"
  end
end
