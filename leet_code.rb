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

end
