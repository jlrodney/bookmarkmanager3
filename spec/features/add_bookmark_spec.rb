feature 'add bookmark' do
  scenario 'should let user add bookmarks' do
    visit("/add_bookmarks")
    expect(page).to have_button ('Add!')
  end

  scenario 'should redirect to bookmarks page after submission ' do
    visit('/add_bookmarks')
    fill_in :title, with: 'Imgur'
    fill_in :bookmark, with: 'http://www.imgur.com'
    click_button 'Add!'
    expect(page).to have_content('Imgur')
  end
end
