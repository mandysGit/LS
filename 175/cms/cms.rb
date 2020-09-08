require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

get '/' do
  @files = Dir.new("data").children
  erb :index
end

get '/:file' do
  headers["Content-Type"] = "text/plain"
  File.read("data/#{params[:file]}")
end

