#test





flg_sw = false

input_file = File.open('fig.fth', 'r') do |f|
  f.each_line do |l|
#    puts l
    if t = l.match(/^SCR . (\d+)/)
      if t[1].to_i==6
        flg_sw = true
      end
    elsif t = l.match(/^\s+(\d+)\s*(.*)$/)
      if t[1].to_i>=6
        puts t[1]+":" + t[2]
      end
    else
     
    end
  end
end
