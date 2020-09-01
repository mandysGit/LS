require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @file_names = Dir.glob("public/*/*").map { |path| File.basename(path) }.sort
  @file_names.reverse! if params[:sort] == "desc"
  erb :home
end
