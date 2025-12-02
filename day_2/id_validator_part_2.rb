# Part 2 - does not work on big input yet though...

INPUT_FILE="input.txt"


class IdValidator
  def initialize(id)
    @id = id
  end

  def valid?
    idstr = String(@id)
    valid_num_digits = []
    (1..idstr.size).each do |d|
      valid_num_digits.push(d) if idstr.size % d == 0
    end
    valid_num_digits.each do |num_digits|
      digits = []
      idx = 0
      while idx + num_digits <= idstr.size
        digits.push(idstr[idx..(idx + num_digits-1)])
        idx += num_digits
      end
      digit_occurences = digits.group_by {|d| d}.values
      next if digit_occurences.size > 1

      if digit_occurences[0].size > 1
        return false
      end
      num_digits += 1
    end
    return true
  end
end

def main
  invalid_ids = []
  File.open(INPUT_FILE, "rt") do |f|
    f.read.split(",").each do |range|
      range.gsub!("\n", "")
      start, finish = range.split("-").map { |strnum| Integer(strnum) }
      (start..finish).each do |id|
        id_validator = IdValidator.new(id)
        invalid_ids.push(id) unless id_validator.valid?
      end
    end
  end
  p invalid_ids.sum()
end

main()
