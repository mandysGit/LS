require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'

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
      render_markdown(File.read(file))
    when ".txt"
      headers["Content-Type"] = "text/plain"
      File.read(file)
    end
  end

  def valid_file_extension(file) 
    file.include?(".md") || file.include?(".txt")
  end

  def signed_in?
    session[:username] != nil
  end

  def require_signed_in_user
    if !signed_in?
      session[:message] = "You must be signed in to do that."
      redirect "/"
    end
  end

  def valid_credentials?(username, password)
    credentials = load_user_credentials

    if credentials.key?(username)
      bcrypt_password = BCrypt::Password.new(credentials[username])
      bcrypt_password == password
    else
      false
    end
  end
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end
  YAML.load_file(credentials_path)
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

get "/" do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map do |path|
    File.basename(path)
  end
  erb :index
end

get "/users/signin" do
  erb :signin
end

post "/users/signin" do
  credentials = load_user_credentials
  username = params[:username]

  if valid_credentials?(username, params[:password])
    session[:username] = username
    session[:message] = "Welcome!"
    redirect "/"
  else
    session[:message] = "Invalid Credentials"
    status 422
    erb :signin
  end
end

post "/users/signout" do
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect "/"
end

get "/new" do
  require_signed_in_user
  erb :new
end

post "/new/create" do
  require_signed_in_user

  if params[:new_file].empty?
    session[:message] = "A name is required."
    status 422

    erb :new
  elsif !valid_file_extension(params[:new_file])
    session[:message] = "A valid file extension is required."
    status 422

    erb :new
  else
    file_path = File.join(data_path, params[:new_file])
    File.write(file_path, "")
    session[:message] = "#{params[:new_file]} was created."

    redirect "/"
  end
end

get "/:file" do
  file_path = File.join(data_path, params[:file])

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:file]} does not exist."
    redirect "/"
  end
end

get "/:file/edit" do
  require_signed_in_user

  @file_name = params[:file]
  file_path = File.join(data_path, @file_name)
  @content = File.read(file_path)

  erb :edit
end

post "/:file/edit" do
  require_signed_in_user

  @file_path = File.join(data_path, params[:file])
  File.write(@file_path, params[:content])

  session[:message] = "#{params[:file]} has been updated."
  redirect "/"
end

post "/:file/delete" do
  require_signed_in_user

  file_path = File.join(data_path, params[:file])
  File.delete(file_path)

  session[:message] = "#{params[:file]} has been deleted."
  redirect "/"
end

