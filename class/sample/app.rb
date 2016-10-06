require "sinatra"
require "sinatra/reloader" if development?
# require "faker"
enable :sessions

get ("/") do


  erb(:index, {:layout => :template})

end

post ("/") do


  # erb(:index, {:layout => :template})

end

get ("/re") do
  redirect ("/")

end