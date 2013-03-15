class LeetCode
  def remove_element(A, elem)
    before = 0
    after = 0

    return 0 if A.empty?

    while after < A.size
      if A[after] != elem
        A[before] = A[after]
        before += 1
      end

      after += 1
    end

    A = A[0..(before - 1)]  if before > 0

    return before
  end # end of method


end
