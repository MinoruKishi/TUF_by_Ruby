




class Forth

  def initialize
=begin  
  (    @array_size = 50
    @top_of_stack = @array_size - 1
    @botom_of_stack = 0
    @prog_count = 0
    @word_name = "w_cld"
    @reg_bp = @top_of_stack
    @reg_sp@reg_si, @reg_ax, @reg_bx, @reg_dx
)
=end
    @array_size = 50
    @top_of_stack = @array_size - 1
    @botom_of_stack = 0
    @prog_count = 0
    @word_name = "@w_init"
    @reg_bp = @top_of_stack
    @reg_sp = @botom_of_stack
    @reg_si = @word_name + ".cfa"# = 
    @reg_si_old = @word_name + ".cfa"# = 
    @reg_ax = 0
    @reg_bx = 0
    @reg_dx = 0
    @reg_fetch_bx = 0
    @loop_state=true
    @jmp_entry = "NEXT"
   puts "**initialize**"    
  end


  def fii_dpush
    puts "***DPUSH***"
# push ax
#    mov [sp],ax
#    add sp,1
    @stack[@reg_sp] = @reg_dx
    @reg_sp += 1
#    self.fii_next
  end

  def fii_apush
    puts "***APUSH***"
# push ax
#    mov [sp],ax
#    add sp,1
    @stack[@reg_sp] = @reg_ax
    @reg_sp += 1
#    self.fii_next
  end

  def fii_next

    puts "***NEXT***"
#NEXT:
#       LODSQ       ; RAX <- [RIP (== RSI)]
# AX:                   ; RSI += 8  
    puts "fii_next:reg_si_old:" + @reg_si 

    @reg_ax = eval(@reg_si) 
#    if (/\./.match(@reg_ax))==nil
#      @is_word_param = false
#      puts "@reg_ax:@reg_ax not equal word address"
#    else
#      @is_word_param = true
    
      puts "fii_next:reg_ax:" + @reg_ax 
      word_name = (/[^\.]+/.match(@reg_si)).to_s
      word_sub  = (/\.[^\.]+/.match(@reg_si)).to_s
      puts "word_name(si):" + word_name
      puts "word_sub (si):" + word_sub
      next_word_name = (/[^\.]+/.match(@reg_ax)).to_s
      next_word_sub  = (/\.[^\.]+/.match(@reg_ax)).to_s
      puts "next_word_name(bx):" + next_word_name
      puts "next_word_sub (bx):" + next_word_sub
#    end


# DX
    @reg_dx = @reg_bx = @reg_ax
#    if @is_word_param==false
#      puts "@reg_dx:@reg_ax not equal word address"
#    elsif next_word_sub==".ml"
    if next_word_sub==".ml"
      puts "## ml"
      @reg_dx = next_word_name + ".pfa[" + @prog_count.to_s + "]"
      puts "fii_next:reg_dx:" + @reg_dx
    elsif next_word_sub==".cfa"
      @prog_count = 0
      puts "## cfa"
      @reg_dx = next_word_name + ".pfa[" + @prog_count.to_s + "]"
      puts "fii_next:reg_dx:" + @reg_dx
    elsif next_word_sub.match(/\.pfa/)
      @prog_count += 1
      puts "## pfa"
      @reg_dx = next_word_name + ".pfa[" + @prog_count.to_s + "]"
      puts "fii_next:reg_dx:" + @reg_dx
    else
      puts "## null"
      puts 
    end

# jmp[BX]
#puts "eval(@reg_bx)?:" + eval(@reg_bx).to_s
#    if @is_word_param==false
#      puts "@reg_dx:@reg_ax not equal word address"
#    elsif eval(@reg_bx)==nil
    if eval(@reg_bx)==nil
      puts "jmp[BX]:eval(@reg_bx)==nil"
      @reg_fetch_bx = "nil"

    elsif word_sub==".cfa"
      puts "jmp[BX].cfa:eval(@reg_bx):"
      puts eval(@reg_bx)
      @reg_fetch_bx = eval(@reg_bx)
      puts "===eval(RUBY_CODE)===:"
      puts eval(eval(@reg_bx))
      eval(eval(eval(@reg_bx)))
      puts "===end (RUBY_CODE)===:"
    elsif /\.pfa/.match(word_sub)
      puts "jmp[BX].pfa:eval(@reg_bx):"
      puts eval(@reg_bx)
      @reg_fetch_bx = eval(@reg_bx)
      puts "===eval(RUBY_CODE)===:"
      puts eval(eval(@reg_bx))
      eval(eval(eval(@reg_bx)))
      puts "===end (RUBY_CODE)===:"
    else
      puts "jmp[BX].else:eval(@reg_bx):"
      puts eval(@reg_bx)
      @reg_fetch_bx = eval(@reg_bx)
      puts "eval(RUBY_CODE):" + eval(eval(@reg_bx))
    end

# si++
    @reg_si_old = @reg_si
      puts "word_name:" + word_name
      puts "word_sub:" + word_sub

    if @reg_fetch_bx=="@w_colon.ml"
      @reg_si = @reg_dx
      puts "si++:@reg_si = @reg_dx"
    elsif word_sub==".cfa"
      @prog_count = 0
      @reg_si = word_name + ".pfa[" + @prog_count.to_s + "]"
      puts "si++:@reg_si = '.pfa[0]'"
    elsif /\.pfa/.match(word_sub)
       @prog_count += 1
      @reg_si = word_name + ".pfa[" + @prog_count.to_s + "]"
      puts "si++:@reg_si = '.pfa[" + @prog_count.to_s + "]''"
    else
      puts "!!! word_sub:" + word_sub  
    end

    puts "reg_si_NEXT:" + @reg_si

    puts "@loop_state:" + @loop_state.to_s
    @loop_state # if @loop_state==faise then bye (EXIT)
    puts
    puts 


  end
  


  def fii_next1

    puts "***NEXT1***"
#NEXT1:
#. MOV DX,BX
#. INC DX
#. 
# AX:                   ; RSI += 8  
    puts "fii_next:reg_si_old:" + @reg_si 

    @reg_ax = eval(@reg_si) 
#    if (/\./.match(@reg_ax))==nil
#      @is_word_param = false
#      puts "@reg_ax:@reg_ax not equal word address"
#    else
#      @is_word_param = true
    
      puts "fii_next:reg_ax:" + @reg_ax 
      word_name = (/[^\.]+/.match(@reg_si)).to_s
      word_sub  = (/\.[^\.]+/.match(@reg_si)).to_s
      puts "word_name(si):" + word_name
      puts "word_sub (si):" + word_sub
      next_word_name = (/[^\.]+/.match(@reg_ax)).to_s
      next_word_sub  = (/\.[^\.]+/.match(@reg_ax)).to_s
      puts "next_word_name(bx):" + next_word_name
      puts "next_word_sub (bx):" + next_word_sub
#    end


# DX
    @reg_dx = @reg_bx = @reg_ax
#    if @is_word_param==false
#      puts "@reg_dx:@reg_ax not equal word address"
#    elsif next_word_sub==".ml"
    if next_word_sub==".ml"
      puts "## ml"
      @reg_dx = next_word_name + ".pfa[" + @prog_count.to_s + "]"
      puts "fii_next:reg_dx:" + @reg_dx
    elsif next_word_sub==".cfa"
      @prog_count = 0
      puts "## cfa"
      @reg_dx = next_word_name + ".pfa[" + @prog_count.to_s + "]"
      puts "fii_next:reg_dx:" + @reg_dx
    elsif next_word_sub.match(/\.pfa/)
      @prog_count += 1
      puts "## pfa"
      @reg_dx = next_word_name + ".pfa[" + @prog_count.to_s + "]"
      puts "fii_next:reg_dx:" + @reg_dx
    else
      puts "## null"
      puts 
    end

# jmp[BX]
#puts "eval(@reg_bx)?:" + eval(@reg_bx).to_s
#    if @is_word_param==false
#      puts "@reg_dx:@reg_ax not equal word address"
#    elsif eval(@reg_bx)==nil
    if eval(@reg_bx)==nil
      puts "jmp[BX]:eval(@reg_bx)==nil"
      @reg_fetch_bx = "nil"

    elsif word_sub==".cfa"
      puts "jmp[BX].cfa:eval(@reg_bx):"
      puts eval(@reg_bx)
      @reg_fetch_bx = eval(@reg_bx)
      puts "===eval(RUBY_CODE)===:"
      puts eval(eval(@reg_bx))
      eval(eval(eval(@reg_bx)))
      puts "===end (RUBY_CODE)===:"
    elsif /\.pfa/.match(word_sub)
      puts "jmp[BX].pfa:eval(@reg_bx):"
      puts eval(@reg_bx)
      @reg_fetch_bx = eval(@reg_bx)
      puts "===eval(RUBY_CODE)===:"
      puts eval(eval(@reg_bx))
      eval(eval(eval(@reg_bx)))
      puts "===end (RUBY_CODE)===:"
    else
      puts "jmp[BX].else:eval(@reg_bx):"
      puts eval(@reg_bx)
      @reg_fetch_bx = eval(@reg_bx)
      puts "eval(RUBY_CODE):" + eval(eval(@reg_bx))
    end

# si++
    @reg_si_old = @reg_si
      puts "word_name:" + word_name
      puts "word_sub:" + word_sub

    if @reg_fetch_bx=="@w_colon.ml"
      @reg_si = @reg_dx
      puts "si++:@reg_si = @reg_dx"
    elsif word_sub==".cfa"
      @prog_count = 0
      @reg_si = word_name + ".pfa[" + @prog_count.to_s + "]"
      puts "si++:@reg_si = '.pfa[0]'"
    elsif /\.pfa/.match(word_sub)
       @prog_count += 1
      @reg_si = word_name + ".pfa[" + @prog_count.to_s + "]"
      puts "si++:@reg_si = '.pfa[" + @prog_count.to_s + "]''"
    else
      puts "!!! word_sub:" + word_sub  
    end

    puts "reg_si_NEXT:" + @reg_si

    puts "@loop_state:" + @loop_state.to_s
    @loop_state # if @loop_state==faise then bye (EXIT)
    puts
    puts 


  end
  

  def do_forth



    @stack = Array.new(@array_size, 0)



# Structにdefを定義する
#User = Struct.new("User", :name, :age) do
#  def intro
#    "私の名前は#{name}"
#  end
#  
#  def say(word)
#    word
#  end
#end
#
#user1 = User.new("Taro",92)
#p user1.intro #=> 私の名前はTaro
#p user1.say("こんにちは") #=> こんにちは
#

#asm =
#Struct.new("Asm", :asm_code)


    fii = Struct.new("Fii", :nfa0, :nfa1, :lfa, :pushd, :pusha, :next )
 
    words = Struct.new("Words", :nfa0, :nfa1, :lfa, :cfa, :pfa, :ml) 


##FORTHのVM

#
#; ****FORTH_INNER_INTERPRETER****
#
#DPUSH: PUSH RDX
#APUSH: PUSH RAX
#NEXT:
#       LODSQ       ; RAX <- [RIP (== RSI)]
#                   ; RSI += 8  
#       MOV   RBX,RAX         ;
#       MOV RDX,RBX
#       ADD RDX,8
#
#       JMP   QWORD PTR [RBX] ; JUMP TO (IP)
# 

# 1）ax <- si
# 2) si++
# 3) bx <- ax
# 4) dx <- bx
# 5) 
#
#


#; COLD STATE VECTOR COMES HERE
#
#CLD9::
#
# CLD                 ; Clears the DF flag in the EFLAGS register. 

# MOV RSI,OFFSET CLD1 ; SET UP IP
# MOV RSP,QWORD PTR ADR_S0 ; SET UP SP
#   sub     rsp, 28h
# MOV RBP,QWORD PTR ADR_R0 ; SET UP RP
#



#@reg_si = "@w_init.pfa[0]" 

    @w_start = words.new(0x85, "START", 0, "@w_init.cfa", [""], "")

    @w_init = words.new(0x84, "INIT", "@w_start.lfa", "@w_colon.ml", ["@w_cld.cfa", "@w_cold.cfa", "@w_semis.cfa"], "")


    @w_cld = words.new(0x83, "CLD", "@w_init.lfa", "@w_cld.ml", [], 
<<"EOL"
@reg_sp = @botom_of_stack
@reg_bp = @top_of_stack
@jmp_entry = "NEXT"
puts "JMP to NEXT (" + @reg_si + ")"
EOL
    )

=begin
@w_cld_ml = 
<<"EOL"
@reg_si = "@w_init.pfa[1]" 
@reg_sp = @botom_of_stack
@reg_bp = @top_of_stack
puts "JMP to NEXT (" + @reg_si + ")"
EOL
=end

#    puts "@w_init:" + @w_init.to_s
#    puts "---------"
#    puts "@w_cld:" + @w_cld.to_s
#    puts "---------"


    @w_cold = words.new(0x84, "COLD", "@w_cld.lfa", "@w_colon.ml", ["@w_lit.cfa", "1", "@w_print.cfa", "@w_bye.cfa", "@w_semis.cfa"], "")


    @w_bye = words.new(0x83, "BYE", "@w_cold1.lfa",  "@w_bye.ml", [""], 
#    @rb_bye = 
<<"EOS" 
@loop_state = false
@jmp_entry = "NEXT"
puts "==BYE=="
EOS
    )

    @w_lit = words.new(0x83, "BYE", "@w_bye.lfa",  "@w_lit.ml", [""], 
<<"EOS" 
@reg_ax = eval(@reg_si) 
# si++
word_name = (/[^\.]+/.match(@reg_si)).to_s
word_sub = (/\.[^\.]+/.match(@reg_si)).to_s
puts "word_name(si):" + word_name
puts "word_sub (si):" + word_sub
@reg_si_old = @reg_si
if word_sub==".cfa"
@prog_count = 0
@reg_si = word_name + ".pfa[" + @prog_count.to_s + "]"
puts "si++:@reg_si = '.pfa[0]'"
elsif /\.pfa/.match(word_sub)
@prog_count += 1
@reg_si = word_name + ".pfa[" + @prog_count.to_s + "]"
puts "si++:@reg_si = '.pfa[>=1]'"
else
puts "!!! word_sub:" + word_sub  
end
#@reg_ax = eval(@reg_si) 
puts "reg_ax:" + @reg_ax
puts "reg_si_old:" + @reg_si_old
puts "reg_si:" + @reg_si  
@jmp_entry = "APUSH"
puts "==LIT=="
EOS
    )

    @w_print = words.new(0x85, "PRINT", "@w_lit.lfa",  "@w_print.ml", [""], 
<<"EOS"
    @reg_sp -= 1
    @reg_ax = @stack[@reg_sp]
    puts "print:" + @reg_ax.to_s + " "
#    puts "reg_si_NEXT:" + @reg_si
@jmp_entry = "NEXT"
EOS
    )

#execute
# pop bx SPから引く
# jmp next1
    @w_exec = words.new(0x87, "EXECUTE", "@w_init.lfa", "@w_exec.ml", [], 
<<"EOL"
    @reg_sp -= 1
    @reg_bx = @stack[@reg_sp] 
    @jmp_entry = "NEXT1"
    puts "JMP to NEXT1 (" + @reg_sp + ")"
EOL
    )

#branch
# add si,[si]
    @w_bran = words.new(0x86, "BRANCH", "@w_exec.lfa", "@w_bran.ml", [], 
<<"EOL"
    @reg_si = eval(@reg_si)
    @jmp_entry = "NEXT"
    puts "JMP to NEXT (" + @reg_sp + ")"
EOL
    )

#0branch
# pop ax
# or ax,ax
# if z add si,[si]
# else si++
# end
# jmp next
    @w_zbran = words.new(0x87, "ZBRANCH", "@w_bran.lfa", "@w_zbran.ml", [], 
<<"EOL"
    @reg_sp -= 1
    @reg_ax = @stack[@reg_sp] 
    if @reg_ax==0
      @reg_si = eval(@reg_si)
    else
      @reg_si = @reg_si.inc_si
    end
    @jmp_entry = "NEXT"
    puts "JMP to NEXT (" + @reg_sp + ")"
EOL
    )

#(loop)
# mov bx,1
# add [bp],bx
# mov ax, [bp]
# sub ax,2[bp]
# xor ax,bx
# if s add si,[si]
# else
#   add bp,4
#   sub si,2
# end
# jmp next

    @w_xloop = words.new(0x87, "(LOOP)", "@w_zbran.lfa", "@w_xloop.ml", [], 
<<"EOL"
    @reg_bx = 1
    eval(@reg_bp)+= @reg_bx
    
    
    @reg_si = eval(@reg_si)
    @jmp_entry = "NEXT"
    puts "JMP to NEXT (" + @reg_sp + ")"
EOL
    )



# (+loop)
# pop bx
# add [bp],bx
# mov ax, [bp]
# sub ax,2[bp]
# xor ax,bx
# if s add si,[si]
# else
#   add bp,4
#   sub si,2
# end
# jmp next
# 


# (do)
# pop dx
#    @reg_sp -= 1
#    @reg_ax = @stack[@reg_sp] 
# pop ax
# xchg bp,sp
# push ax
# push dx
# xchg bp,sp
# jmp next  

# and
# pop ax
# pop bx
# and ax,bx
# jmp pusha

# or
# pop ax
# pop bx
# or ax,bx
# jmp pusha

# xor
# pop ax
# pop bx
# xor ax,bx
# jmp pusha

# sp@
# mov ax,sp
# jmp apush

# sp!
# mov sp,6[bx]
# jmp next

#rp@









#@w_docol_ml = words.new(0x86, "CLD_ML", 0, "@w_docol_ml.ml", [""], "@rb_docol")

#w_docol = asm.new("rb_docol")

=begin
@w_colon = words.new(0x81, ":", "@w_cold.lfa", "@rb_docol", ["@w_bye.cfa", "@w_semis"], "@rb_docol")
@rb_docol = 
<<"EOS" 
@reg_bp -= 1
@stack[@reg_bp] = @reg_si
@reg_si = @reg_dx
puts "NEXT from @rb_docol:"
puts ".    SI:" + @reg_si 
puts ".    BP:" + @reg_bp.to_s 
EOS
=end

    @w_colon = words.new(0x81, ":", "@w_bye.lfa", "@w_colon.ml", ["@w_bye.cfa", "@w_semis.cfa"], 
<<"EOS" 
@reg_bp -= 1
@stack[@reg_bp] = @reg_si
@reg_si = @reg_dx
@jmp_entry = "NEXT"
puts "NEXT from @rb_docol:"
puts ".    SI:" + @reg_si 
puts ".    BP:" + @reg_bp.to_s 
EOS
    )


    @w_semis = words.new(0x82, ";S", "@w_colon.lfa", "@w_semis.ml", [], 
<<"EOS" 
@reg_si = @stack[@reg_bp]
@reg_bp += 1
@jmp_entry = "NEXT"
puts "NEXT from @rb_semis:"
puts ".    SI:" + @reg_si 
puts ".    BP:" + @reg_bp.to_s 
EOS
    )




=begin
def fii_word
  if @reg_ax==@word_name + ".ml"
    puts @word_name + ".ml:" + "eval(eval(eval(" + @reg_ax + ")))"
    puts eval(eval(eval(@reg_ax)))
  else
    puts "[reg_bx]:" + @reg_ax 
    eval(eval(@reg_ax))
  end
  
end
=end







#cfaにDOCOLかself.mlが入る
#DOCOLの時はpfaにはワード列が格納されている
#　cfa:"w_docol"
#. pfa[0]:"w_lit"
#. pfa[1]:123
#. pfa[2]:"w_終了"
#-->


#self.mlの時はpfaにはRuby言語の文字列が格納されている
#. cfa:eval("self.ml")
#. pfa[0]: Ruby言語の文字列

  end
  def pp
    puts " -->@loop_state:" + @loop_state.to_s
  end
  def loop_state
    @loop_state
  end
  def loop_end
    @loop_state = false
  end
  
=begin
  def nabeatsu(num)
    if    num == 0
        @reg_si
    elsif num == 1
        @reg_bx

    else
        num.to_s
    end
  end
=end
  def set_si(str)
    @reg_si = str
  end
  def getp_reg(data)
    puts "reg_si     :" + data[0] + "--> " + @reg_si_old
    puts "reg_bx     :" + data[1] + "--> " + @reg_bx
    puts "[bx]       :" + data[2] + "--> " + @reg_fetch_bx
    puts "reg_dx     :" + data[3] + "--> " + @reg_dx
    puts "reg_si_next:" + data[4] + "--> " + @reg_si
  end
  def loop_param
    @jmp_entry
    

end

test = Forth.new
test.do_forth
#Forth.do_forth

=begin     
#while(test.pp ) do
  test.set_si("@w_start.cfa")
  test.fii_next
  test.getp_reg(["@w_start.cfa","@w_init.cfa", "@w_colon.ml", "init.pfa[0]", "@w_init.pfa[0]"])
  test.pp
  test.fii_next
  test.getp_reg(["@w_init.pfa[0]","@w_cld.cfa", "@w_cld.ml", "@w_cld.pfa[0]", "@w_init.pfa[1]"])
  test.pp
  test.fii_next
  test.getp_reg(["@w_init.pfa[1]","@w_cold.cfa", "@w_colon.ml", "@w_cold.pfa[0]", "@w_cold.pfa[0]"])
  test.pp
  test.fii_next
  test.getp_reg(["@w_cold.pfa[0]","@w_bye.cfa", "@w_bye.ml", "bye.pfa[0]", "@w_cold.pfa[1]"])
  test.pp
#  test.fii_next
#  test.getp_reg(["@w_cold.pfa[1]","@w_semis.cfa", "@w_semis.ml", "cold.pfa[0], "@w_cold.pfa[2]"])
=end
count=0
  test.set_si("@w_start.cfa")
  while(test.loop_state ) do
    case test.loop_param

      when "DPUSH"
        test.fii_dpush
        test.fii_apush
        test.fii_next
      when "APUSH"
        test.fii_apush
        test.fii_next
      when "NEXT"
        test.fii_next
      else
        puts "ERROR:loop_param not found"
      end
    count+=1
    if count==10
      test.loop_end
    end
      
end
  end

#end

q