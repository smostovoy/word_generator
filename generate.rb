# encoding: utf-8
search_pattern = ARGV[0]
search_letters = search_pattern.split ''
rules = {
    all_present: true,
    end_with: true
}

files = ['dic/ru.gnd', 'dic/ru_RU.dic']
files.each do |file|
  File.open file do |infile|
    while (line = infile.gets)
      dic_word = line.split(/[\s\/]/).first
      #p "/^#{"[#{search_pattern}]" * search_letters.size} $/"
      if rules[:all_present]
        p dic_word if dic_word =~ /^[#{search_pattern}]{#{search_letters.size}}$/
      end
      if rules[:end_with]
        p dic_word if dic_word =~ /#{search_pattern}$/
      end
    end
  end
end