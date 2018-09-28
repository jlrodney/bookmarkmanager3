require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative './lib/bookmark'


class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    flash[:notice] = "Hooray, Flash is working!"
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
    flash[:notice] = "Please submit a valid URL" unless Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end
  # post '/adder' do
  #   if Bookmark.valid?(url: params[:url]) == false
  #     flash[:fatal] = "Fatal: Invalid URL"
  #     redirect '/add_bookmarks'
  #   else
  #     Bookmark.create(title: params[:title], url: params[:url])
  #     redirect '/bookmarks'
  #   end
  # end

  get '/delete_bookmarks' do
    erb :delete_bookmark
  end

  post '/deleter' do
    Bookmark.delete(url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
