feature 'index_page' do
  scenario 'should have title of bookmarks' do
    visit('/')
    expect(page).to have_content "Bookmarks"
  end
end

feature 'bookmarks' do
  scenario 'should give us a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('MA', 'http://www.makersacademy.com');")

    visit('/bookmarks')

    expect(page).to have_content 'MA'
  end
end
