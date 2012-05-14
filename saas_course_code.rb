# Problem 1
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_history_name = attr_name + "_history"
    
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_history_name 
    
    class_eval %Q{
      def #{attr_name}=(attr_name)
        @#{attr_history_name} ||= [nil]
        @#{attr_history_name} << attr_name 
      end
      
      def #{attr_history_name}
        @#{attr_history_name}
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
  attr_accessor_with_history :far
end

# Problem 2
def combine_anagrams(words)
  groups = {}
  words.each do |word|
    groups.has_key?(word.downcase.chars.sort.join("")) ? groups[word.downcase.chars.sort.join("")] << word : groups[word.downcase.chars.sort.join("")] = [word]
  end 
  groups.values 
end

# Problem 3
def palindrome?(string)
  trimmed_str = string.downcase.gsub(/[\W|[:punct:]]/, '') if string
  string ?  trimmed_str == trimmed_str.reverse : false
end

# Problem 4
def count_words(string)
  words = string.downcase.gsub(/[\W|[:punct:]]/, ' ').split(/\b\s+/)
  word_counter = {} 
  words.each do |word|
    word_counter[word] = word_counter[word].to_i + 1
  end
  word_counter
end