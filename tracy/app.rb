require "sinatra"

enable :sessions


get '/' do
  erb :index, layout: :template
end

post '/' do
  session[:array] ||= []
  session[:array] = params[:name_list].split(",")
  if params[:method] == "count"
    session[:res] = count_randomize(session[:array], session[:number])
  elsif params[:method] == "number"
    session[:res] = number_randomize(session[:array], session[:number])
  end
  erb :index, layout: :template
end

def count_randomize(array, count)
  res = []
  array.shuffle!
  i = 0
  while i < array.length
    for j in 0...count
      if (i < array.length)
        if res[j].nil?
          res[j] = []
          res[j].push array[i]
        else
          res[j].push array[i]
        end
      end
      i += 1
    end
  end
  res
end


def number_randomize(array, number)
  res = []
  team = []
  array.shuffle!
  for name in array
    team.push name
    if (team.length >= number)
      res.push team
      team = []
    end
  end
  if (!team.nil?)
    res.push team
  end
  res
end