INPUT_FILE = "day1__part3.txt"
INITIAL_POSITION = 50

def main()
  current_position = INITIAL_POSITION
  num_zero_hits = 0
  File.open(INPUT_FILE, "rt") do |f|
    f.each_line do |line|
      line.gsub!("\n", "")
      direction = line[0] == "R" ? -1 : 1
      num_rotations = Integer(line[1..-1])
      full_revolutions = (num_rotations / 100).floor()
      num_zero_hits += full_revolutions
      num_rotations -= full_revolutions * 100
      prev_position = current_position
      current_position += num_rotations * direction
      if 0 < prev_position and prev_position < 100 and (current_position <= 0 or current_position >= 100)
        num_zero_hits += 1
      end
      current_position = current_position % 100
    end
  end
  p num_zero_hits
end

main()
