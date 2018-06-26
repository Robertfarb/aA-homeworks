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

    stone_count.times do |idx|
      @cups[start_pos + idx + 1] << :stone
      next if start_pos + idx == 6 || start_pos + idx == 13
    end

    cups[start_pos] = []

    render
    next_turn(start_pos + stone_count)
    end_cup = @cups[start_pos + stone_count]

    if end_cup.empty?
      return :switch
    elsif end_cup.length > 1
      return start_pos + stone_count
    elsif end_cup.count == 6 || end_cup.count == 13
      return :prompt
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
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
  end
end

if __FILE__ == $PROGRAM_NAME
  brd1 = Board.new
  brd1.place_stones
  p brd1.cups
end
