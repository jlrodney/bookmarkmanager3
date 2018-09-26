require 'pg'
require 'uri'

class Bookmark

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

  def self.create(url)

    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect dbname: 'bookmark_manager_test'
    else
      con = PG.connect dbname: 'bookmark_manager'
    end

    string = "INSERT INTO bookmarks (url) VALUES ('" + url + "');"
    con.exec(string)
  end

  def self.delete(url)
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect dbname: 'bookmark_manager_test'
    else
      con = PG.connect dbname: 'bookmark_manager'
    end

    string = "DELETE FROM bookmarks WHERE url = '" + url + "';"
    con.exec(string)
  end

  def self.valid?(url)
    uri = URI.parse url
    uri.kind_of? URI::HTTP
  rescue URI::InvalidURIError
    uri.kind_of? URI::HTTPS
  rescue URI::InvalidURIError
    false
  end


end
