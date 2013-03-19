class LeetCode
  def self.remove_element(a, elem)
=begin
*****************************************************************************************************
  Given an array and a value, remove all instances of that value in place and return the new length.

  The order of elements can be changed. It doesn't matter what you leave beyond the new length.
******************************************************************************************************
=end

    return 0 if a.empty?

    index = 0
=begin
    while after < a.size
      if a[after] != elem
        a[before] = a[after]
        before += 1
      end

      after += 1
    end

    a = a[0..(before - 1)]  if before > 0
=end

    a.each do |v|
      if v != elem
        a[index] = v
        index += 1
      end
    end

    a = a[0..(index - 1)] if index > 0

    return a.size
  end # end of method

  def self.remove_duplicates(a)
=begin
****************************************************************************************************
  Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.

  Do not allocate extra space for another array, you must do this in place with constant memory.

  For example,
  Given input array A = [1,1,2],

  Your function should return length = 2, and A is now [1,2].
****************************************************************************************************
=end
    return 0 if a.empty?

    elem = nil
    index = 0

    a.each do |v|
      if(v != elem)
        a[index] = v
        elem = v
        index += 1
      end
    end

    a = a[0..(index - 1)] if index > 0

    return a.size
  end

  def self.plus_one(digits)
=begin
***************************************************************************
  Given a number represented as an array of digits, plus one to the number.
***************************************************************************
=end

    carry = 1

    output = []

    digits.reverse_each.map do |d|

      if d + carry > 9
        d = 0
      else
        d = d + carry
        carry = 0
      end
      #output.push(d)
      output.unshift(d)
    end

    #output = output.reverse!

    #output = [1].concat(output) if output[0] == 0
    output.unshift(1) if output[0] == 0

    return output

  end

  def self.length_of_last_word(s)

    return 0  if s.size == 0 || s[-1, 1] == " "

    return s.split(" ").last.size

  end

end
