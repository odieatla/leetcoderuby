class LeetCode
  @@path_sum = []
  @@path_sum_sub = []

  @@ladders = []
  @@ladder_size = 0

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

    return 0  if s.size == 0 || s.gsub(/\s+/, '') == ""

    return s.split(" ").last.size

  end

  def self.delete_duplicates_from_sorted_list(head)

    start = head # start is a pointer pointing to node head. not a copy. same as in java.

    return head if head.nil?

    second = head.next

    while !second.nil?
      if head.val == second.val
        head.next = second.next
      else
        head = second
      end

      second = second.next
    end

    return start
  end

  def self.path_sum(tree, sum)
    return false if tree.nil?

    return self.path_sum_i(tree, sum, 0)
  end

  def self.path_sum_i(tree, sum, result)

    result += tree.val

    return true if result == sum && tree.left.nil? && tree.right.nil?

    l_r = false
    r_r = false

    l_r = self.path_sum_i(tree.left, sum, result) if !tree.left.nil?

    r_r = self.path_sum_i(tree.right, sum, result) if !tree.right.nil?

    return l_r || r_r
  end

  def self.path_sum_2(tree, sum) #return the result array
    @@path_sum = []

    return @@path_sum if tree.nil?

    self.path_sum_2_i(tree, sum, 0, [])

    return @@path_sum

  end

  def self.path_sum_2_i(tree, sum, result, result_array)

    result += tree.val

    result_array.push(tree.val)

    @@path_sum.push(result_array.clone()) if result == sum && tree.left.nil? && tree.right.nil?

    self.path_sum_2_i(tree.left, sum, result, result_array) if !tree.left.nil?

    self.path_sum_2_i(tree.right, sum, result, result_array) if !tree.right.nil?

    result_array.pop #if number, pass the value, no change to the original var(sum), if obj, pass a pointer, change the original obj(result_array) -- so for obj, use clone if the copy in certain stages is wanted.

  end

  def self.is_balanced(root)
    #left_route = self.is_balanced_i(root.left)
    #right_route = self.is_balanced_i(root.right)

    #return ((left_route - right_route).abs > 1 ? false : true)

    return true if root.nil?

    return false if (self.is_balanced_i(root.left) - self.is_balanced_i(root.right)).abs > 1

    return self.is_balanced(root.left) && self.is_balanced(root.right)
  end

  def self.is_balanced_i(root)

    return 0 if root.nil?

    return [self.is_balanced_i(root.left), self.is_balanced_i(root.right)].max + 1

  end

  def self.is_symmetric(root)

    return true if root.nil?

    return ((self.is_symmetric_i(root.left, []) == self.is_symmetric_i(root.right, []).reverse) ? true : false)
  end

  def self.is_symmetric_i(root, result)
    if !root.nil?

      self.is_symmetric_i(root.left, result)

      result.push(root.val)

      self.is_symmetric_i(root.right, result)

    end

    return result
  end

  def self.is_same_tree(root1, root2)
    return true if root1.nil? && root2.nil? 

    return false if root1.nil? || root2.nil? || root1.val != root2.val

    return self.is_same_tree(root1.left, root2.left) && self.is_same_tree(root1.right, root2.right)

  end

  def self.max_depth(root)

    return 0 if root.nil?

    left = self.max_depth(root.left)

    right = self.max_depth(root.right)

    return ((left > right) ? left : right ) + 1
  end

  def self.min_depth(root) #tricky than max depth. consider one or both child is 0.
    return 0 if root.nil?

    left = self.min_depth(root.left)

    right = self.min_depth(root.right)

    return ((left < right) ? right : left) + 1 if (left == 0 || right == 0)

    return ((left < right) ? left : right) + 1
  end

  def self.is_one_letter_diff(str1, str2)

    word1 = str1.split('')
    word2 = str2.split('')

    return false if word1.size != word2.size

    count = 0

    word1.each_with_index do |c, i|
      if(c != word2[i])
        count += 1
        return false if count > 1
      end
    end

    return (count == 1) ? true : false

    
  end

  def self.find_ladders(startw, endw, dict, result)

    if self.is_one_letter_diff(startw, endw) && !result.empty? && (@@ladder_size == 0 || result.size <= @@ladder_size)
      @@ladders.push(result)
      @@ladder_size = result.size
    end

    dict.each do |w|
      if self.is_one_letter_diff(startw, w) && !result.include?(w)
        result.push(w)
        self.find_ladders(w, endw, dict)
        result.pop(w)
      end
    end
  end

  def self.find_ladders_f(startw, endw, dict)

    @@ladders = []
    @@ladder_size = 0

    self.find_ladders(startw, endw, dict, [])

    return @@ladders
  end

  def self.two_sum(numbers, target)

    numbers.each_with_index do |n, i|

      if i < numbers.size - 1
        ((i + 1)..(numbers.size - 1)).each do |index|
          return [i + 1, index + 1] if n + numbers[index] == target
        end
      end

    end
  end

  def self.reverse_int(x)
    return 0 if x == 0

    y = x.abs

    flag = 1

    flag = -1 if x + y == 0

    out = 0

    while y > 0
      out = out * 10 + y%10
      y = y/10

    end 

    return flag * out
  end

  def self.is_palindrome(x)
    return false if x < 0

    div = 1

    while x/div >= 10
      div *= 10
    end

    while x > 0
      last = x%10
      first = x/div

      return false if first != last

      div = div/100
      x = (x%div)/10
    end

    return true
  end

  def self.roman_to_int_dic(r)
    case r
    when 'I'
      return 1
    when 'V'
      return 5
    when 'X'
      return 10
    when 'L'
      return 50
    when 'C'
      return 100
    when 'D'
      return 500
    when 'M'
      return 1000
    else
      return 0
    end
  end

  def self.roman_to_int(s)
    a = s.split('')

    out = 0

    a.each_with_index do |r, i|
      r = self.roman_to_int_dic(r)

      if i+1 < a.size && r < self.roman_to_int_dic(a[i+1]) #IV
        out -= r
      else
        out += r
      end

    end

    return out
  end

  def self.int_to_roman(number)
    return false if number < 0;

    dict = Hash.new

    dict[1] = 'I'
    dict[5] = 'V'
    dict[10] = 'X'
    dict[50] = 'L'
    dict[100] = 'C'
    dict[500] = 'D'
    dict[1000] = 'M'

    div = 1

    out = ""

    while number > 0
      n = number%10

      if n == 9 || n == 4
        out = "#{dict[div]}#{dict[div * (n+1)]}#{out}"
      elsif n == 0
        #do nothing
      else
        digits = ""
        m = n - 5

        if m >= 0
          digits = "#{dict[div*5]}"
        end

        out = "#{digits}#{dict[div] * (m>=0 ? m : n)}#{out}"
      end

      div *= 10

      number /= 10
    end

    return out
  end
end
