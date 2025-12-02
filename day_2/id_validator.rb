# Part one, does not work on big input...

INPUT_FILE="input.txt"
# expected result: 30323879646


class IdValidator
  def initialize(id)
    @id = id
  end

  def valid?
    idstr = String(@id)
    num_digits = 1
    return true if idstr.size.odd?

    num_digits = idstr.size / 2
    start = idstr[..(num_digits-1)]
    remainder = idstr[num_digits..-1]
    start != remainder
  end
end

def main
  ids_sum = 0
  File.open(INPUT_FILE, "rt") do |f|
    f.read.split(",").each do |range|
      range.gsub!("\n", "")
      start, finish = range.split("-").map { |strnum| Integer(strnum) }
      (start..finish).each do |id|
        id_validator = IdValidator.new(id)
        ids_sum += id unless id_validator.valid?
      end
    end
  end
  p ids_sum
end

main()
