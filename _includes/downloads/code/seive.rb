def set(array,num)
  ((num**num)..array.length).step(num) do |i|
    array[i-1] = 1
  end 
  p array.inspect
  return array
end 

def seive(num)
  if num < 2
    return nil
  end 
  a = [0]*num
  (1..num).each do |i|
    if a[i] == 0
      puts "#{i+1}"
      a=set(a,i+1)
    end
  end 

  return a
end 

p seive(50).inspect
