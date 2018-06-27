require_relative 'mancala'
require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1 = "bob", name2 = "simon")
    @cups = Array.new(14) {[]}
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      4.times {cup << :stone} unless idx == 6 || idx == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > cups.length
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stone_count = cups[start_pos].count
    cups[start_pos] = []

    stone_count.times do |idx|
      pos = (start_pos + idx + 1) % @cups.length
      @cups[pos] << :stone
      next if current_player_name == @name1 && pos == 6
    end

    render
    next_turn(start_pos + stone_count)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :promdpt, or ending_cup_idx
    end_cup = @cups[ending_cup_idx]
    if end_cup.empty?
      return :switch
    elsif end_cup.length > 1
      return ending_cup_idx
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].all? {|cup| cup.empty?} || @cups[7..12].all?{|cup| cup.empty?}
  end

  def winner
    if @cups[6].count == @cups[13].count
      return :draw
    elsif @cups[6].length > @cups[13].length
      return @name1
    else
      return @name2
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  brd1 = Board.new
  brd1.place_stones
  p brd1.cups
end
