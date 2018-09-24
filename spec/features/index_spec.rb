feature 'index_page' do
  scenario 'should have title of bookmarks' do
    visit('/')
    expect(page).to have_content "Bookmarks"
  end
end

feature 'bookmarks' do
  scenario 'should give us a list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
  end
end
