require "sinatra"
require "sinatra/reloader" if development?
# require "faker"
enable :sessions

get ("/") do


  erb(:index, {:layout => :template})

end

post ("/") do
  # string is the client's input
  # "zhu1,zhu2,zhu3"
  string=params[:string]

  session[:arr]=string.split(",")

  numOfPeople=session[:arr].length
  numOfTeam=params[:num].to_i

  @error=""
  if numOfPeople<numOfTeam
    @error="Too short!"
    return erb(:error, {:layout => :template})

  end


  # one dimention array with random
  @newArr=[]

  while (session[:arr].length>0)


    @newArr<<myRand(session[:arr])

  end

  # set a two dimention array
  @twoArr=[]


  (0...@newArr.length).step(numOfTeam).each do |index|
    # step is depended on num of team

    # arr is a temp variable
    arr=[]
    for i in 0...numOfTeam
      arr<<@newArr[index+i]

    end


    @twoArr<<arr

  # [[1,2],[3,4]]
  end


  return erb(:index, {:layout => :template})

end


def myRand(arr)

  max=arr.length
  lucky=Random.rand(max)
  lucky_person=arr[lucky]
  arr.delete(lucky_person)
  return lucky_person


end