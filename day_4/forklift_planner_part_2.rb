INPUT_FILE = "input.txt"
PAPER_CHAR = "@"
EMPTY_CHAR = "."

class AccessibilityChecker
  def initialize(coordinates, row_size)
    @coordinates = coordinates
    @row_size = row_size
    @max_num_neighbours = 3
  end

  def accessible?(check_pos_x, check_pos_y)
    x_min = [check_pos_x - 1, 0].max
    x_max = [check_pos_x + 1, @row_size - 1].min
    y_min = [check_pos_y - 1, 0].max
    y_max = [check_pos_y + 1, @coordinates.size - 1].min
    x_range = x_min..x_max
    y_range = y_min..y_max
    # p [check_pos_x, check_pos_y]
    # p "To check: #{x_range}, #{y_range}"

    num_neighbours = 0
    y_range.each do |y_pos|
      x_range.each do |x_pos|
        next if y_pos == check_pos_y and x_pos == check_pos_x

        num_neighbours += 1 if @coordinates[y_pos][x_pos] == PAPER_CHAR
      end
    end
    # p num_neighbours
    num_neighbours <= @max_num_neighbours
  end
end


def main
  num_accessible = 0
  File.open(INPUT_FILE, "rt") do |f|
    coordinates = f.each_line.map { |line| line.gsub("\n", "") }
    do_next_iter = true
    while do_next_iter
      accessibles = []
      checker = AccessibilityChecker.new(coordinates, coordinates[0].size)
      coordinates.each_with_index do |row, y_pos|
        row.each_char.each_with_index do |pos, x_pos|
          next if pos != PAPER_CHAR

          accessibles.push([x_pos, y_pos]) if checker.accessible?(x_pos, y_pos)
        end
      end
      for x_pos, y_pos in accessibles
        coordinates[y_pos][x_pos] = EMPTY_CHAR
      end
      num_accessible += accessibles.size
      do_next_iter = accessibles.size > 0
    end
  end
  p num_accessible
end

main
