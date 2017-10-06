require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  order = params['order']
  
  @title = "Cat pics"
  @files = Dir.glob("public/*").map { |file| File.basename(file) }.sort
  @files.reverse! if order == "descending"
  @sort = (order == "descending" ? "ascending" : "descending")

  erb :home
end
