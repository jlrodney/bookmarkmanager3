require 'pg'
require 'uri'

class Bookmark
  def self.all
    bookmarks = connect.exec('SELECT * FROM bookmarks;')
    bookmarks.map do |bookmark|
      Bookmark.new(
        id: bookmark['id'],
        title: bookmark['title'],
        url: bookmark['url']
      )
    end
  end

  def self.create(url:, title:)
    return false unless is_url?(url)
    result = connect.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  private

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect dbname: 'bookmark_manager_test'
    end
    PG.connect dbname: 'bookmark_manager'
  end

  def self.is_url?(url)
    url =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end
end
