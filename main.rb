require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pry'
require 'pg'

# root to /videos
get '/' do   
  redirect to ("/videos")
end

get "/videos" do
  sql =  "select * from videos"
  @videos = run_sql(sql)
  erb :index
end