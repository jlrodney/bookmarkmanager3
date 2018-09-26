require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    #form - add bookmarks and view bookmarks
    erb :hello
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/add_bookmarks' do
    erb :add_bookmark
  end

  post '/adder' do
    Bookmark.create(params[:bookmark])
    redirect '/bookmarks'
  end

  get '/delete_bookmarks' do
    erb :delete_bookmark
  end

  post '/deleter' do
    Bookmark.delete(params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
