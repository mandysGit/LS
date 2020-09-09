require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'

configure do
  enable :sessions
  set :session_secret, "secret"
end

helpers do
  def render_markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(text)
  end

  def load_file_content(file)
    extension = File.extname(file)

    case extension
    when ".md"
      render_markdown(File.read("data/#{file}"))
    when ".txt"
      headers["Content-Type"] = "text/plain"
      File.read("data/#{file}")
    end
  end
end

get "/" do
  @files = Dir.new("data").children
  erb :index
end

get "/:file" do
  file = params[:file]
  @files = Dir.new("data").children

  if @files.include?(file)
    load_file_content(file)
  else
    session[:message] = "#{file} does not exist."
    redirect "/"
  end
end

get "/:file/edit" do
  @file = params[:file]
  @content = File.read("data/#{@file}")

  erb :edit
end

post "/:file/edit" do
  @file = params[:file]
  File.write("data/#{@file}", params[:content])

  session[:message] = "#{@file} has been updated."
  redirect "/"
end
