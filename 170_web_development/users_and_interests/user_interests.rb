require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

before do
  @user_data = YAML.load_file('users.yaml')
  @names = @user_data.keys
  @num_users = @names.size
  @num_interests = count_interests
end

helpers do
  def count_interests
    @user_data.values.reduce(0) { |sum, data| sum + data[:interests].size }
  end
end

get '/' do
  redirect '/users'
end

{:jamy=>{:email=>"jamy.rustenburg@gmail.com", :interests=>["woodworking", "cooking", "reading"]}, 
 :nora=>{:email=>"nora.alnes@yahoo.com", :interests=>["cycling", "basketball", "economics"]}, 
 :hiroko=>{:email=>"hiroko.ohara@hotmail.com", :interests=>["politics", "history", "birding"]}} 

get '/users' do
  erb :users
end

get '/users/:name' do
  @name = params[:name].to_sym
  @email = @user_data[@name][:email]
  @interests = @user_data[@name][:interests]

  @other_users = @names.reject { |name| name.to_s == @name }

  erb :interests
end