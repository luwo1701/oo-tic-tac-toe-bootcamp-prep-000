class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  #@location
  def initialize (board = [" "," "," "," "," "," "," "," "," "])
   @board = board
  end
  
  def move(index,char)
      @board[index]=char
  end
  
  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts  "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts  "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

   def input_to_index(location)
     #puts "string conversion is #{location.to_i}"
     location.to_i - 1 
   end
 
   def turn_count
     count=0
     @board.each do |entry|
       if entry=="" || entry== " " || entry == nil
         count +=1
       end
     end
     return 9-count
  end

  def current_player
    if turn_count%2==0
      return "X"
    else
      return "O"
    end
  end
  
  def full?
    @board.none? do |i| 
      i==" " || i=="" || i==nil
    end
  end
  
  def position_taken?(index)
    puts @board[index]
    puts 
    return !(@board[index]==" "|| @board[index]==""|| @board[index]==nil) 
  end
  
  def valid_move?(index)#assumes index as argument not user input
    return index.between?(0,8) && !position_taken?(index)   
  end 
  
  def won?
    WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == @board[combo[1]] &&  @board[combo[1]]== @board[combo[2]] && @board[combo[0]] != " "
          return combo
        end
      end
      return false
  end
  
  def turn 
    puts "Please enter a number between 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) #&& !over?
      move(index,current_player)
      display_board()
    else
      #puts "Please enter a number between 1-9:"
      turn
    end
  end
  
  def draw?
    return full? && !won?
  end
  
  def over?
    return won? || draw?
  end
  
  def winner
    if !won?
      return nil
    else
      #puts "#{@board} winner is #{@board[won?[0]]} combo is #{won?}"
      return @board[won?[0]]
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
        
    
  end
end

=begin
game= TicTacToe.new(["X", "X", "X", " ", " ", " ", " ", " ", " "])

game.won?
game.winner
game.display_board

=end
