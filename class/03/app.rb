require "sinatra"
require "sinatra/reloader" if development?
# require "faker"
enable :sessions

get ("/") do


  erb(:index, {:layout => :template})

end

post ("/list") do
  title=params[:title];

  session[:list]||=[]

  session[:list].push(title)
  # p session[:list]

  erb(:list, {:layout => :template})

  # erb(:index, {:layout => :template})

end

get ("/re") do
  redirect ("/")

end