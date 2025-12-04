INPUT_FILE = "input.txt"
# expected value: 17107


def main
  joltage_sum = 0
  File.open(INPUT_FILE, "rt") do |f|
    f.each_line do |line|
      line.gsub!("\n", "")
      # p line
      digits = line.chars
      rjust_size = line.size.digits.size
      max_num_index = digits.each_with_index.sort_by { |val, idx| "#{val}_#{(line.size - idx).to_s.rjust(rjust_size, "0")}"}[-1][1]
      # p max_num_index
      if max_num_index < line.size - 1
        first_digit = digits[max_num_index]
        second_digit = digits[max_num_index + 1..-1].max
      else
        first_digit = digits[..max_num_index-1].max
        second_digit = digits[max_num_index]
      end
      line_joltage = Integer("#{first_digit}#{second_digit}")
      # p line_joltage
      joltage_sum += line_joltage
    end
  end
  p joltage_sum
end


main
