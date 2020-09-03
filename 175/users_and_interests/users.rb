require 'yaml'
require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

before do
  @users = YAML.load_file("users.yaml")
  @users_count = @users.keys.size
  @interest_count = count_interests
end

get "/" do
  redirect "/list"
end

get "/list" do
  erb :list
end

get "/:name" do
  @name = params[:name].to_sym
  @email = @users[@name][:email]
  @interests = @users[@name][:interests].join(', ')
  erb :user
end

helpers do
  def count_interests
    @users.values.reduce(0) do |sum, hsh|
      sum + hsh.dig(:interests).count
    end
  end
end

