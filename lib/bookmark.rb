require 'pg'

class Bookmark

  BOOKMARKS = [
      "http://www.makersacademy.com",
      "http://www.destroyallsoftware.com",
      "http://www.google.com"
     ]

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect dbname: 'bookmark_manager_test'
    else
      con = PG.connect dbname: 'bookmark_manager'
    end

    table = con.exec "SELECT * FROM bookmarks"

    table.map do |row|
      row['url']
    end
  end
end
