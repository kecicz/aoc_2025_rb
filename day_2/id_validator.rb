# Part one, does not work on big input...

INPUT_FILE="input.txt"
# expected result: 30323879646

def sum_invalid_ids(num_digits, range_start, range_end)
  if num_digits.odd?
    num_digits += 1
    range_start = 10.pow(num_digits-1)
  end

  base_num_digits = num_digits/2
  base = range_start / 10.pow(base_num_digits)
  sum = 0
  while base < 10.pow(base_num_digits)
    invalid_id_candidate = (base*10.pow(base_num_digits)) + base
    return sum if invalid_id_candidate > range_end
    sum += invalid_id_candidate if invalid_id_candidate > range_start
    base += 1
  end
  sum + sum_invalid_ids(num_digits + 2, 10.pow(num_digits + 1), range_end)
end


def main
  ids_sum = 0
  File.open(INPUT_FILE, "rt") do |f|
    f.read.split(",").each do |range|
      range.gsub!("\n", "")
      start, finish = range.split("-").map { |strnum| Integer(strnum) }
      num_digits = start.to_s.size
      ids_sum += sum_invalid_ids(num_digits, start, finish)
    end
  end
  p ids_sum
end

main()
