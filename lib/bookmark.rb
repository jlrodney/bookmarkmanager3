require 'pg'
require 'uri'

class Bookmark

  def self.all
    table = connect.exec "SELECT * FROM bookmarks"

    table.map do |row|
      row['url']
    end
  end

  def self.create(url)
    string = "INSERT INTO bookmarks (url) VALUES ('" + url + "');"
    connect.exec(string)
  end

  def self.delete(url)
    string = "DELETE FROM bookmarks WHERE url = '" + url + "';"
    connect.exec(string)
  end

  def self.valid?(url)
    uri = URI.parse url
    uri.kind_of? URI::HTTP
  rescue URI::InvalidURIError
    uri.kind_of? URI::HTTPS
  rescue URI::InvalidURIError
    false
  end

  def self.connect
    if ENV['ENVIRONMENT'] = 'test'
      return PG.connect dbname: 'bookmark_manager_test'
    end
    PG.connect dbname: 'bookmark_manager'
  end

end
