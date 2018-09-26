require 'pg'
require 'uri'

class Bookmark

  def self.all
    table = connect.exec "SELECT * FROM bookmarks"

    table.map do |row|
      {title: row['title'], url: row['url']}
    end
  end

  def self.create(title, url)
    string = "INSERT INTO bookmarks (title, url) VALUES ('" + title + "', '" + url + "');"
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
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect dbname: 'bookmark_manager_test'
    end
    PG.connect dbname: 'bookmark_manager'
  end

end
