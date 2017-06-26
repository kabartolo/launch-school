module Displayable
  def clear
    system('cls') || system('clear')
  end

  def display_table(table)
    table.each { |label, value| puts " | #{label}: #{value}" }
  end

  def prompt(message)
    puts ">>#{message}"
  end

  def user_chooses_option(message, options)
    loop do
      prompt("Do you want to #{message}")
      answer = gets.chomp.downcase
      return answer if options.include?(answer)
      prompt("Please enter #{options.join(', ')}")
    end
  end
end
