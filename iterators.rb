# def conversation
#   puts "Hello"
#   yield
#   puts "Goodbye"
# end

# conversation { puts "Good to meet you!" }

# def five_times
#   1.upto(5){ |i| yield(i) }
# end

# five_times do |n|
#   puts "#{n} situps"
#   puts "#{n} pushups"
#   puts "#{n} chinups"
# end


def n_times(number)
  1.upto(number) do |i|
    yield(i)
  end
end

n_times(15) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
