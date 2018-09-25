require './lib/bookmark'

describe Bookmark do
  context "#all" do
    it "should return an Array of Bookmark instances" do
      expect(Bookmark.all).to eq ["http://www.makersacademy.com", "http://www.google.com", "http://www.destroyallsoftware.com"]
    end
  end

end
