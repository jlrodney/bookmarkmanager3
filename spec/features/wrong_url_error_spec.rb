feature 'wrong url' do
  scenario 'Error message after user inputs incorrect URL' do
    visit('/add_bookmarks')
    fill_in :bookmark, with: 'w.jon>.ram'
    click_button 'Add!'
    expect(page).to have_content('Invalid URL')
  end
end
