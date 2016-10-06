require "sinatra"
require "sinatra/reloader" if development?
# require "faker"
enable :sessions

use Rack::MethodOverride

get ("/") do


  erb(:index, {:layout => :template})

end

get("/list") do
  erb(:list, {:layout => :template})



end




post("/list") do
  session[:note]||=[]
  title=params[:title]
  body=params[:body]
  arr=[]
  arr.push(title)
  arr.push(body)
  session[:note].push(arr)



  erb(:list, {:layout => :template})

end

delete "/delete" do
  session[:note].pop
  erb(:list, {:layout => :template})



end

post "/delete" do
  session[:note].pop
  erb(:list, {:layout => :template})



end


get ("/re") do
  redirect ("/")

end