class Questions
    attr_accessor :correct
    
    def initialize(player)
      @num1 = rand(20)
      @num2 = rand(20)
      @answer = @num1 + @num2
    
      puts "#{player}: What does #{@num1} plus #{@num2} equal?"

      @input = gets.chomp

      if @input == @answer.to_s
        puts "Correct! #{@num1} + #{@num2} does indeed equal #{@answer}"
        @correct = true
      else @input != @answer.to_s
        puts "Ah sorry, that was wrong... The correct answer is: #{@answer}"
        @correct = false
      end
    end
end