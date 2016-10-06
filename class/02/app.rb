require "sinatra"
require "sinatra/reloader" if development?
# require "faker"
enable :sessions

get ("/") do


  erb(:index, {:layout => :template})

end

post ("/") do
  amount=params[:amount].to_i
  tax=params[:tax].to_i
  tip=params[:tip].to_i
  num=params[:num].to_i
  @result=amount*(1+tax/100.0)*(1+tip/100.0)/num

  erb(:index, {:layout => :template})

  # redirect ("/")


  # erb(:index, {:layout => :template})

end

get ("/re") do
  redirect ("/")

end