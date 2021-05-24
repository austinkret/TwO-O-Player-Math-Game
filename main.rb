require './players.rb'
require './question.rb'

class Game
  
  def initialize
    puts "----------------------------------------"
    puts "----------------------------------------"
    puts "------- Welcome to the Math Game! ------"
    puts "----- A battle of wits and wisdom! -----"
    puts "----------------------------------------"
    puts "--------- If you answer wrong ----------"
    puts "----------- you lose a life ------------"
    puts "-- lose all three lives and you lose! --"
    puts "--- Player 1, it's your turn first! ----"
    puts "----------------------------------------"
    puts "----------------------------------------"
    puts "-------------- START GAME --------------"
    puts ""

    @player = 'Player 1'

    @player1 = Player.new
    @player2 = Player.new

    @player1_lives = "#{@player1.lives} / 3"
    @player2_lives = "#{@player2.lives} / 3"

    @end = false

    until @end
      turn
    end
  end
  
  def turn 
    puts "--------------- NEW TURN ---------------"
    question = Questions.new(@player)
    
    if !question.correct
      wrong
    end

    if question.correct
      correct
    end
    
    if @player == 'Player 1'
      @player = 'Player 2'
    else @player == 'Player 2'
      @player = 'Player 1'
    end
  end
  
  def correct
    puts "P1: #{@player1_lives} vs. P2: #{@player2_lives}"
  end
  
  def wrong
    if @player == 'Player 1'
      @player1.wrong
      @player1_lives = "#{@player1.lives} / 3"
    end
    
    if @player == 'Player 2'
      @player2.wrong
      @player2_lives = "#{@player2.lives} / 3"
    end

    puts "P1: #{@player1_lives} vs. P2: #{@player2_lives}"
    
    if @player1.lives == 0
      @end = true
      puts ""
      puts "-------------- GAME OVER ---------------"
      puts "----------------------------------------"
      puts "----------- WINNER: PLAYER 2 -----------"
      puts "----------------------------------------"
      puts "------------- FINAL SCORE --------------"
      puts "-------- P1: #{@player1_lives} vs. P2: #{@player2_lives} -------"
      puts "----------------------------------------"
      puts "----------------------------------------"
      puts ""
    end

    if @player2.lives == 0
      @end = true
      puts ""
      puts "-------------- GAME OVER ---------------"
      puts "----------------------------------------"
      puts "----------- WINNER: PLAYER 1 -----------"
      puts "----------------------------------------"
      puts "------------- FINAL SCORE --------------"
      puts "-------- P1: #{@player1_lives} vs. P2: #{@player2_lives} -------"
      puts "----------------------------------------"
      puts "----------------------------------------"
      puts ""
    end
  end
end

start_game = Game.new