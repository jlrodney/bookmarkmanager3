require 'pg'

class Bookmark

  BOOKMARKS = [
      "http://www.makersacademy.com",
      "http://www.destroyallsoftware.com",
      "http://www.google.com"
     ]

  def self.all
    # BOOKMARKS

    bookmarks = []
    con = PG.connect :dbname => 'bookmark_manager'

    table = con.exec "SELECT * FROM bookmarks"

    table.each do |row|
      bookmarks << "%s" % [ row['url'] ]
    end
    bookmarks
  end
end
