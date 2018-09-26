feature 'bookmark link' do
  scenario 'user should click on bookmark and navigate to URL' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('MA', 'http://www.makersacademy.com');")
    visit('/bookmarks')
    expect(page).to have_link('Visit', href: 'http://www.makersacademy.com')
  end
end
