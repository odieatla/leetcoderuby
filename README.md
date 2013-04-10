Ruby Solution for LeetCode

reverse integer:
  consider the possiblity of overflow

Palindrome Number:
  if reverse, could overflow
  watch out: 1001, 101

Longest Common Prefix
  watch out: input array size 0, and BE CAREFUL about the DETAIL!
  Not complicated, but easy to get wrong.

Remove Nth Node From End of List
  only go through list once

Swap Nodes in Pairs
  special case: input {1} -- input only one node in the list

Search Insert Position
  watch out: the edge for the situation when target < a[mid]. since mid could = start, but mid couldn't = end
