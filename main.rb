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

private

def run_sql(sql)
  conn = PG.connect(dbname: 'memetube', host: 'localhost')
  begin
    result = conn.exec(sql)
  ensure
    conn.close
  end
  result
end