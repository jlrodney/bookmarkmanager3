require './lib/bookmark'

describe Bookmark do
  describe ".all" do
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

  describe ".create" do
    it "should add a new bookmark to database" do
      Bookmark.create("www.imgur.com")

      expect(Bookmark.all).to include "www.imgur.com"
    end
  end

  describe ".delete" do
    it "should add a new bookmark to database" do
      Bookmark.create("www.imgur.com")

      expect(Bookmark.all).to include "www.imgur.com"

      Bookmark.delete("www.imgur.com")

      expect(Bookmark.all).not_to include "www.imgur.com"

    end
  end

  describe '.valid' do
    context 'valid http url' do
      it 'should return true' do
        expect(Bookmark.valid?('http://www.bbc.co.uk')).to be true
      end
    end
    context 'valid https url' do
      it 'should return true' do
        expect(Bookmark.valid?('https://www.bbc.co.uk')).to be true
      end
    end
    context 'invalid url' do
      it 'should return false' do
      end
    end
    context '' do
    end
    context '' do
    end
    context '' do
    end
    context '' do
    end
  end

end
