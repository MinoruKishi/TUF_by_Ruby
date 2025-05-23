#test






flg_sw = false
#words = [ [] ]

@flg_words_new = 0
@last_word_name = "@last_word_name"
@make_ml_now = ""
@list_code = []
@list_col = []
@list_words = []

@ans_list = []
@col_flg = ""

    @fii = Struct.new(:nfa0, "FII", :lfa, :pushd, :pusha, :next )
 
    @words = Struct.new(:nfa0, :nfa1, :lfa, :cfa, :pfa, :ml) 

    @ml = Struct.new(:nfa0, :nfa1, :lfa, :pfa) 




def share_word(w) #":"と"CODE"でワードを新設する

=begin
@col_flg = w.match(/^.+\"$/)

@col_flg = @col_flg.to_s

if @col_flg != nil
  puts "@col_flg:"
  puts @col_flg
end
=end

  if @flg_words_new == 0 && w == '('
    @flg_words_new = 01
#puts w
  elsif @flg_words_new == 01 && w == ')'
    @flg_words_new = 0
  elsif @flg_words_new == 01 && w == '*)'
    @flg_words_new = 0
  elsif @flg_words_new == 01
    # nothing to do
  
  
#  elsif w.to_a
  
  
  elsif @flg_words_new == 0 && w == '."'
    @flg_words_new = 02
#puts w
  elsif @flg_words_new == 02 && w == '"'
    @flg_words_new = 0
  elsif @flg_words_new == 02 && 
    @flg_words_new = 0
  elsif @flg_words_new == 02
    # nothing to do
  
  elsif @flg_words_new == 0 && w == ':' 
    @flg_words_new = 11
  elsif @flg_words_new == 0 && w == 'CODE' 
    @flg_words_new = 21
    
    
    
    
  #':'の場合
  elsif @flg_words_new == 11
  
    @list_col.push(w)
    
    @flg_words_new = 12

  elsif @flg_words_new == 12 

    if w==";"
      @flg_words_new = 0
    end
    if @list_words.find {|x| x == w } == nil
      @list_words.push(w)
      puts "find col:" + w
    end

  #'CODE'の場合
  elsif @flg_words_new == 21
  
    @list_code.push(w)
    
    @flg_words_new = 22

  elsif @flg_words_new == 22 

    if w=="JMP,"
      @flg_words_new = 0
    end
    if @list_words.find {|x| x == w } == nil
      @list_words.push(w)
    end

  else
  end
end



input_file = File.open('fig_test01.rb', 'r') do |f|
#input_file = File.open('test20250516.rb', 'r') do |f|
  f.each_line do |l|
#    puts l
    if t = l.match(/^SCR . (\d+)/)
      if t[1].to_i>=6
        flg_sw = true
      else
        flg_sw = false
      end
  #
    elsif t = l.match(/^\s+(\d+)\s*(.*)$/)
      if flg_sw == true
#        puts t[1]+":" + t[2]
        t2=t[2].split(' ')
        
#        puts t2
        t2.each do |tt|
#        puts tt
#        puts "tt:" + 
share_word(tt)

        end
      end
    else
     
    end
  end
  
  puts "@list_code:" + @list_code.to_s
  puts
  puts "@list_col:" + @list_col.to_s
  puts
  puts "@list_words:" + @list_words.sort.to_s
  puts
  @ans_list = @list_words
  puts "ans_list1:" + @ans_list.to_s
#  @list_code.each do |w|
#    puts
#    puts "@list_code w:" + w.to_s
#    puts "before:" + @ans_list.to_s
#間違い： @ans_list = @ans_list.delete(w)
#    @ans_list.delete(w)
#    まだdeleteの使い方がわかってない
#　　wのクラスは何❓deleteの結果のクラスは何❓なぜbeforeで文字列が表示できないのか❓
#    puts "after:" + @ans_list.to_s
#  end
  puts
#  puts "ans_list2:" + 
  @list_code.each do |w|
#間違い： @ans_list = @ans_list.delete(w)
    @ans_list.delete(w)
    puts "now code deleted:"  + w
  end
  @list_col.each do |w|
#間違い： @ans_list = @ans_list.delete(w)
    @ans_list.delete(w)
    puts "now col deleted:"  + w
  end
  puts
  puts "ans_list3:" + @ans_list.to_s
end

                                              