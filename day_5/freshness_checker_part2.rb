INPUT_FILE="input.txt"
# Expected result: 344813017450467

class FreshnessChecker
  def initialize(ranges)
    @ranges = ranges
    _deduplicate_ranges()
  end

  def _deduplicate_ranges
    sorted = @ranges.sort_by { |first, _| first }
    dedup_ranges = []
    start = nil
    finish = nil
    sorted.each do |range|
      if start == nil and finish == nil
        start, finish = range
      elsif finish < range[0]
        dedup_ranges.push([start, finish])
        start, finish = range
      elsif finish < range[1]
        finish = range[1]
      end
    end
    dedup_ranges.push([start, finish]) if start != nil and finish != nil    
    @ranges = dedup_ranges
  end

  def fresh?(id)
    @ranges.each do |range|
      return true if id >= range[0] and id <= range[1]
    end

    return false
  end

  def num_possible_fresh_ids
    num_ids = 0
    @ranges.each do |range|
      start, finish = range
      num_ids += finish - start + 1
    end
    return num_ids
  end
end


def main
  ranges = []

  File.open(INPUT_FILE, "rt") do |f|
    f.each_line do |line|
      line.gsub!("\n", "")
      if line.empty?
        checker = FreshnessChecker.new(ranges)
        
        p checker.num_possible_fresh_ids
        return
      end

      ranges.push(line.split("-").map(&:to_i))
    end
  end
end

main
