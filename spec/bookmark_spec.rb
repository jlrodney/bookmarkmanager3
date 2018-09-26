require './lib/bookmark'

describe Bookmark do
  describe ".all" do
    it "should return an Array of Bookmark instances" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (title, url) VALUES ('MA', 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Google', 'http://www.google.com');")

      expect(Bookmark.all).to include({:title=>"MA", :url=>"http://www.makersacademy.com"})
      expect(Bookmark.all).to include({:title=>"Google", :url=>"http://www.google.com"})
    end
  end

  describe ".create" do
    it "should add a new bookmark to database" do
      Bookmark.create('Imgur', "www.imgur.com")

      expect(Bookmark.all).to include({:title=>"Imgur", :url=>"www.imgur.com"})
    end
  end

  describe ".delete" do
    it "should add a new bookmark to database" do
      Bookmark.create('Imgur', "www.imgur.com")

      expect(Bookmark.all).to include({:title=>"Imgur", :url=>"www.imgur.com"})

      Bookmark.delete("www.imgur.com")

      expect(Bookmark.all).not_to include({:title=>"Imgur", :url=>"www.imgur.com"})

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
        expect(Bookmark.valid?('www.bbc.co.uk')).to be false
      end
    end
    context 'invalid url' do
      it 'should return false' do
        expect(Bookmark.valid?('hello')).to be false
      end
    end
  end

end
