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

post "/index" do
  title = params[:title]
  description = params[:description]
  url = params[:url]
  genre = params[:genre]
  sql = "INSERT INTO videos ( title, description, genre, url, views) VALUES (#{sql_string(title)}, #{sql_string(description)}, '#{genre}', '#{url}', 0);"
  @video = run_sql(sql) 
  if request.xhr?
    json @video 
  else
   redirect to ('/')
  end
end

get "/videos/:id" do
  sql = "UPDATE videos SET views=(views + 1) WHERE id='#{params[:id]}';"
  run_sql(sql)
  sql = "SELECT * FROM videos WHERE id=#{params[:id]}"
  @video = run_sql(sql).first
  if request.xhr?
    json @video.to_a
  else
   erb :show
  end
end



get "/videos/:id/delete" do
  sql = "DELETE FROM videos where id=#{params[:id]}"
  run_sql(sql)
  redirect to("/videos")
end

get '/items/:id/delete' do
  sql = "delete from videos where id=#{params[:id]}"
  run_sql(sql)
  if request.xhr?
    json [{status: :ok}]
  else 
    redirect_to '/videos'
  end
end






def sql_string(value)
  "'#{value.gsub("'", "''")}'"  
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