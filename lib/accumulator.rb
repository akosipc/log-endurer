class Accumulator
  def initialize(lines)
    @lines = lines
  end

  def accumulate
    @lines.each do |line|
      view = View.new(line)
    end
  end
end
