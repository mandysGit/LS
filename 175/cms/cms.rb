require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, "secret"
end

get "/" do
  @files = Dir.new("data").children
  erb :index
end

get "/:file" do
  file = params[:file]
  @files = Dir.new("data").children

  if @files.include?(file)
    headers["Content-Type"] = "text/plain"
    File.read("data/#{file}")
  else
    session[:message] = "#{file} does not exist."
    redirect "/"
  end
end

