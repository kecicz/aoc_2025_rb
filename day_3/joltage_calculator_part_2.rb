INPUT_FILE = "input.txt"
NUM_DIGITS = 12
# Also works for part 1 if you have NUM_DIGITS set to 2


def main
  joltage_sum = 0
  File.open(INPUT_FILE, "rt") do |f|
    f.each_line do |line|
      line.gsub!("\n", "")
      # p line
      rjust_size = line.size.digits.size
      to_scan = line
      line_joltage = ""
      NUM_DIGITS.times do |digit|
        digits = to_scan.chars[..-(NUM_DIGITS - digit)]
        max_num_index = digits.each_with_index.sort_by { |val, idx| "#{val}_#{(line.size - idx).to_s.rjust(rjust_size, "0")}"}[-1][1]
        # p max_num_index
        joltage = to_scan[max_num_index]
        to_scan = to_scan[max_num_index + 1..]
        line_joltage += joltage
      end
      # p line_joltage
      joltage_sum += Integer(line_joltage)
    end
  end
  p joltage_sum
end


main
