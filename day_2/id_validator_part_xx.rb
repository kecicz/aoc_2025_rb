# This was an attempt I tried before learning to read the assignment.
# This was supposed to find if there are any patterns repeating twice anywhere (not the whole number).
# So, for example also 12125, 2743432743, and so on...
# Not validated


class IdValidator
  def initialize(id)
    @id = id
  end

  def valid?
    idstr = String(@id)
    num_digits = 1
    max_num_digits = idstr.size / 2
    while num_digits <= max_num_digits
      digits = []
      idx = 0
      while idx + num_digits <= idstr.size
        digits.push(idstr[idx..(idx + num_digits-1)])
        idx += num_digits
      end
      digit_occurences = digits.group_by {|d| d}.map { |_, val| val.count}
      if digit_occurences.include?(2)
        return p false
      end
      num_digits += 1
    end
    return true
  end
end
