# frozen_string_literal: true

class Question
  attr_accessor :correct

  def initialize(current_player)
    @num_1 = rand(20)
    @num_2 = rand(20)
    @answer = @num_1 + @num_2
    puts '  '
    puts "     #{current_player}, What does #{@num_1} plus #{@num_2} equal? 🤔"
    ask_question
  end

  def ask_question
    puts '  '
    print ColorizedString['                YOUR ANSWER: '].colorize(:magenta)
    @player_answer = $stdin.gets.chomp
    puts '  '

    if @player_answer == @answer.to_s
      puts ColorizedString['                  CORRECT!  🥳'].colorize(:green)
      puts '  '
      @correct = true

    else
      puts ColorizedString['                WRONG ANSWER! 👎'].colorize(:red)
      puts '  '
      @correct = false

    end
  end
end
