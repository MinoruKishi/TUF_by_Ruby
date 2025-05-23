#20250519 deleteが理解できなくて、実験した
#deleteは直接変数を加工してしまうものだとわかった
a=["aaa", "bbb"]
b="bbb"
#puts "a.delete:" + a.delete(b).class
puts "a:" +a.to_s
puts  a.class
c= a.delete(b)
puts "a:" + a.to_s
puts  a.class
puts "c:" + c.to_s 
puts c.class


=begin
<ans>

a:["aaa", "bbb"]
Array
a:["aaa"]
Array
c:bbb
String
=end


puts "123's Class is?:"
puts 123.class

puts 123.class == Integer
puts eval("123").class == Integer

#input = "1111"
puts "1234"
puts "1234".match(/^[0-9]+$/).class
#=>MachData
puts "1234".match(/^[0-9]+$/)[0]
#=>1234
puts "1234z"
puts "1234z".match(/^[0-9]+$/) ==nil
#=>true


a=["aaa", "bbb", "bbb"]
a.delete("bbb")
puts a

