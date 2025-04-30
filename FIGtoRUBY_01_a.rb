#test







file = File.open('test.txt', 'a')
file.write('sed do eiusmod tempor incididunt')
file.close
File.open('test.txt', 'r') do |file|
 puts file.read
end






text = "前略\nお元気ですか?\n私は元気です。\n中略\nお体にお気をつけて。\n後略。"
text.each_line(chomp: true) {|line|
 p "#{line}: #{line.length}文字"
}



