#test





flg_sw = false

input_file = File.open('fig.fth', 'r') do |f|
  f.each_line do |l|
#    puts l
   if t = l.match(/^SCR . (\d+)/)
     if t[1]=="6"
     
 