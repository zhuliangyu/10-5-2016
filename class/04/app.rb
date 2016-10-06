require "sinatra"
require "sinatra/reloader" if development?
# require "faker"
enable :sessions

get ("/") do

  if session[:name].nil?
    @greet="welcome to my homepage!"
  elsif session[:lang]=="en"
    @greet="Hello,#{session[:name]}"
  elsif session[:lang]=="fr"
    @greet="Bonjour,#{session[:name]}"
  elsif session[:lang]=="es"
    @greet="Hola,#{session[:name]}"
  end

  erb(:index, {:layout => :template})

end

get ("/select") do


  erb(:select, {:layout => :template})

end

post ("/select") do

  session[:name]=params[:name]
  session[:lang]=params[:languages]

  redirect "/"
  # erb(:index, {:layout => :template})

end

get ("/re") do
  redirect ("/")

end