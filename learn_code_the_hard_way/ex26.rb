# http://ruby.learncodethehardway.org/book/ex26.html
# http://ruby.learncodethehardway.org/book/exercise26.txt

# This function will break up words for us.
def break_words(stuff)
    words = stuff.split(' ')
    return words
end

# Sorts the words.
def sort_words(words)
    sorted_words = words.sort()
    return sorted_words
end

# Prints the first word after popping it off.
def puts_first_word(words)
    word = words.shift
    puts word
end

# Prints the last word after popping it off.
def puts_last_word(words)
    word = words.pop
    puts word
end

# Takes in a full sentence and returns the sorted words.
def sort_sentence(sentence)
    words = break_words(sentence)
    return sort_words(words)
end

# Puts the first and last words of the sentence.
def puts_first_and_last(sentence)
    words = break_words(sentence)
    puts_first_word(words)
    puts_last_word(words)
end

# Sorts the words then prints the first and last one.
def puts_first_and_last_sorted(sentence)
    words = break_words(sentence)
    sorted_words = sort_words(words)
    puts_first_word(sorted_words)
    puts_last_word(sorted_words)
end


puts "Let's practice everything."
puts 'You\'d need to know \'bout escapes with \\ that do \n newlines and \t tabs.'

poem = <<POEM
\tThe lovely world
with logic so firmly planted
cannot discern \n the needs of love
nor comprehend passion from intuition
and requires an explantion
\n\t\twhere there is none.
POEM


puts "--------------"
puts poem
puts "--------------"

five = 10 - 2 + 3 - 6
puts "This should be five: %s" % five

def secret_formula(started)
    jelly_beans = started * 500
    jars = jelly_beans / 1000
    crates = jars / 100
    return jelly_beans, jars, crates
end

start_point = 10000
jelly_beans, jars, crates = secret_formula(start_point)

puts "With a starting point of: %s" % start_point
puts "We'd have %s beans, %s jars, and %s crates." % [jelly_beans, jars, crates]

start_point = start_point / 10

puts "We can also do that this way:"
puts "We'd have %s beans, %s jars, and %s crates." % secret_formula(start_point)


sentence = "All good things come to those who wait."

words = break_words(sentence)
sorted_words = sort_words(words)

puts "First Word"
puts_first_word(words)
puts "Last Word"
puts_last_word(words)
puts "First Sorted Word"
puts_first_word(sorted_words)
puts "Last Sorted Word"
puts_last_word(sorted_words)
puts "Print sorted_words"
sorted_words = sort_sentence(sentence)
puts sorted_words

puts "First and Last Word of sentence"
puts_first_and_last(sentence)

puts "First and Last Word of Sorted sentence"
puts_first_and_last_sorted(sentence)

