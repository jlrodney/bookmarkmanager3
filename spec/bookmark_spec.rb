require './lib/bookmark'

describe Bookmark do
  context ".all" do
    it "should return an Array of Bookmark instances" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")

      expect(Bookmark.all).to include "http://www.makersacademy.com"
      expect(Bookmark.all).to include "http://www.google.com"
      expect(Bookmark.all).to include "http://www.destroyallsoftware.com"
    end
  end

  context ".create" do
    it "should add a new bookmark to database" do
      Bookmark.create("www.imgur.com")

      expect(Bookmark.all).to include "www.imgur.com"
    end
  end

end
