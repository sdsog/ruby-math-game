# frozen_string_literal: true

require './player.rb'
require './question.rb'
require 'colorize'
require 'colorized_string'

class Game
  attr_accessor :playerturn

  def initialize
    puts '  '
    puts ColorizedString['  *********************************************'].colorize(:blue).blink
    puts ColorizedString['  *** ULTIMATE RUBY MATH CHALLENGE SHOWDOWN ***'].colorize(:red).bold
    puts ColorizedString['  *********************************************'].colorize(:blue).blink
    puts '  '
    puts '    THE RULES ARE SIMPLE:'.bold
    puts '  '
    puts '    1.) 2 players'
    puts '    2.) Each player gets ❤️  ❤️  ❤️'
    puts '    3.) Answer wrong and you lose a ❤️'
    puts '    4.) Lose all your ❤️ s, you lose the game'
    puts '    5.) Player A goes first...'

    @current_player = 'Player A'

    @first_player = Player.new
    @second_player = Player.new

    lives = 3

    @player_1_lives = @first_player.lives.to_s
    @player_2_lives = @second_player.lives.to_s

    @end = false

    turn until @end
  end

  def turn
    puts '  '
    puts ColorizedString['  --------------------------------------------'].colorize(:magenta)
    puts ColorizedString['                -- NEW ROUND --'].colorize(:light_cyan).bold
    ask_question = Question.new(@current_player)

    # if wrong, removes one life
    wrong unless ask_question.correct

    # change current player
    if @current_player == 'Player A'
      @current_player = 'Player B'

    else @current_player == 'Player B'
         @current_player = 'Player A'

    end

    puts '  -------------------------------------------- '
    puts "    Player A: #{'❤️  ' * @player_1_lives.to_i} | Player B: #{'❤️  ' * @player_2_lives.to_i}"
    puts '  -------------------------------------------- '
  end

  def wrong
    # TODO: check death>
    if @current_player == 'Player 1'
      @first_player.wrong_answer
      @player_1_lives = "#{@first_player.lives}/3"

      if @first_player.lives === 0
        @end = true
        puts ColorizedString['    ****************************************'].colorize(:light_green).blink
        puts ColorizedString['    🍾  🎉  🥳  PLAYER B WINS!!! 🍾  🎉  🥳'].colorize(:light_green).blink
        puts ColorizedString['    ****************************************'].colorize(:light_green).blink
        puts '  '

      end

    else
      @second_player.wrong_answer
      @player_2_lives = "#{@second_player.lives}/3"

      if @second_player.lives === 0
        @end = true
        puts ColorizedString['    ****************************************'].colorize(:light_green).blink
        puts ColorizedString['    🍾  🎉  🥳  PLAYER A WINS!!! 🍾  🎉  🥳'].colorize(:light_green).blink
        puts ColorizedString['    ****************************************'].colorize(:light_green).blink
        puts '  '

      end

    end
  end
end

start = Game.new

# ___________________________________

# class Game

#   puts '  '
#   puts 'Welcome to ULTIMATE MATH CHALLENGE SHOWDOWN'
#   puts '  '
#   puts 'The rules are simple: '
#   puts '  1.) 2 players'
#   puts '  2.) Each player gets 3 lives'
#   puts '  3.) Answer wrong and you lose a life'
#   puts '  4.) Keep playing until one player looses all their lives'
#   puts '  '
#   puts 'HAVE A FRIEND AND READY TO PLAY?'

#   print ' >> "Yes" or "No" '
#   choice = $stdin.gets.chomp

#   if choice.include?('y') || choice.include?('yes')
#     puts('Ok. Player 1 is up first.')
#   else
#     puts('Come back when you find a friend.')
#   end

# end

# ___________________________________

# def gold_room
#   puts 'This room is full of gold.  How much do you take?'

#   print '> '
#   choice = $stdin.gets.chomp

#   # this line has a bug, so fix it
#   if choice.include?('0') || choice.include?('1')
#     how_much = choice.to_i
#   else
#     dead('Man, learn to type a number.')
#   end

#   if how_much < 50
#     puts "Nice, you're not greedy, you win!"
#     exit(0)
#   else
#     dead('You greedy bastard!')
#   end
# end

# def bear_room
#   puts 'There is a bear here.'
#   puts 'The bear has a bunch of honey.'
#   puts 'The fat bear is in front of another door.'
#   puts 'How are you going to move the bear?'
#   bear_moved = false

#   loop do
#     print '> '
#     choice = $stdin.gets.chomp

#     if choice == 'take honey'
#       dead('The bear looks at you then slaps your face off.')
#     elsif choice == 'taunt bear' && !bear_moved
#       puts 'The bear has moved from the door. You can go through it now.'
#       bear_moved = true
#     elsif choice == 'taunt bear' && bear_moved
#       dead('The bear gets pissed off and chews your leg off.')
#     elsif choice == 'open door' && bear_moved
#       gold_room
#     else
#       puts 'I got no idea what that means.'
#     end
#   end
# end

# def cthulhu_room
#   puts 'Here you see the great evil Cthulhu.'
#   puts 'He, it, whatever stares at you and you go insane.'
#   puts 'Do you flee for your life or eat your head?'

#   print '> '
#   choice = $stdin.gets.chomp

#   if choice.include? 'flee'
#     start
#   elsif choice.include? 'head'
#     dead('Well that was tasty!')
#   else
#     cthulhu_room
#   end
# end

# def dead(why)
#   puts why, 'Good job!'
#   exit(0)
# end

# def start
#   puts 'You are in a dark room.'
#   puts 'There is a door to your right and left.'
#   puts 'Which one do you take?'

#   print '> '
#   choice = $stdin.gets.chomp

#   if choice == 'left'
#     bear_room
#   elsif choice == 'right'
#     cthulhu_room
#   else
#     dead('You stumble around the room until you starve.')
#   end
# end
