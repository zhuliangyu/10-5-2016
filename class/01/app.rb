require "sinatra"
require "sinatra/reloader" if development?
# require "faker"

enable :sessions

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'admin' and password == 'admin'
end

# session[:time]=0

get ("/") do
  if session[:time].nil?

    session[:time]=1

  elsif session[:time]+=1

  end

  p params[:color]


  erb(:index, {:layout => :template})

end

post ("/") do


  session[:color]=params[:color]


  erb(:index, {:layout => :template})

end