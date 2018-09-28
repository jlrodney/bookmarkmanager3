feature 'wrong url' do
  scenario 'Error message after user inputs incorrect URL' do
    visit('/add_bookmarks')
    fill_in :title, with: 'w.jon>.ram'
    click_button 'Submit'
    expect(page).to have_content('Please submit a valid URL')
  end
end
