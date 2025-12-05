INPUT_FILE="input.txt"
# Expected result: 558

class FreshnessChecker
  def initialize(ranges)
    @ranges = ranges
  end

  def fresh?(id)
    @ranges.each do |range|
      return true if id >= range[0] and id <= range[1]
    end

    return false
  end
end


def main
  ranges = []
  checker = nil
  num_fresh = 0

  File.open(INPUT_FILE, "rt") do |f|
    ranges_loaded = false

    f.each_line do |line|
      line.gsub!("\n", "")
      if line.empty?
        checker = FreshnessChecker.new(ranges)
        ranges_loaded = true
        next
      end

      if ranges_loaded
        num_fresh += 1 if checker.fresh?(Integer(line))
      else
        ranges.push(line.split("-").map(&:to_i))
      end
    end
  end
  p num_fresh
end

main
