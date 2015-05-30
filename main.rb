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
  if request.xhr?
    json @videos.to_a
  else
    erb :index
  end
end

get "/videos/new" do
  erb :new
end

post "/videos" do
   # sql = "UPDATE videos SET  title=#{sql_string(title)}, description=#{sql_string(description)}, url='#{url}' , genre='#{genre}' WHERE id='#{params[:id]}';"
   # run_sql(sql)
   # @video = 
   redirect to ('/index')
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