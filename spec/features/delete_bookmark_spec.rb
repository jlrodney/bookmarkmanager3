feature 'delete bookmark' do
  scenario 'should have a delete button' do
    visit('/delete_bookmarks')
    expect(page).to have_content 'Remove!'
  end

  scenario "should delete Bookmark" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Google', 'http://www.google.com');")
    visit "/delete_bookmarks"
    fill_in :url, with: 'wwww.imgur.com'
    click_button "Remove!"
    expect(page).to have_content('Google')
    expect(page).not_to have_content('Imgur')
  end
end
