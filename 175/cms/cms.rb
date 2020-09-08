require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

get '/' do
  @files = Dir.new("data").children
  erb :list
end

