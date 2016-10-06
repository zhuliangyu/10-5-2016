
def myrand(string)


  arr=string.split(",")
  max=arr.length
  lucky=Random.rand(max)
  return arr[lucky]




end

p myrand("asd,das,123")