require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :hello
  end
end
