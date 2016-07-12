---
layout: post
title: find the maximum sub-array
category: algorithm
tag:
  - algorithm
---

Details about the problem can be found in https://en.wikipedia.org/wiki/Maximum_subarray_problem
Reference: https://www.amazon.com/Introduction-Algorithms-3rd-MIT-Press/dp/0262033844 Page 68

### Problem
An array contains of n elements which are natural numbers. i.e. ..., -2, -1, 0, 1, 2, ...
Find the start and end positions of elements such that the sum of sub-array would be maximum.
e.g. For array [−2, 1, −3, 4, −1, 2, 1, −5, 4], the maximum sum of sub-array would be [4, −1, 2, 1] which the start and end positions are 3 and 6

### Solution
Using the divide-and-conquer approach, split the array into left and right part.
The maximum sub-array would fall under left sub-array, right sub-array or across the 2 sub-arrays.

### Pseudo-code
{% highlight python linenos %}
def max_crossing_subarray(A, low, mid, high):
  left_sum = float("-inf")
  sum = 0
  for i = mid downto low: # lookup from mid to left side
    sum += A[i]
    if sum > left_sum:    # current sum is greater
      left_sum = sum
      max_left = i        # max_left would be the current position

  right_sum = float("-inf")
  sum = 0
  for j = mid+1 to high:  # lookup from mid+1 to right side
    sum += A[j]
    if sum > right_sum:   # current sum is greater
      right_sum = sum
      max_right = j       # right would be the current position

   return (max_left, max_right, left_sum + right_sum)
{% endhighlight %}

{% highlight python linenos %}
def max_subarray(A, low, high):
  if high == low:
    return (low, high, A[low])
  else:
    mid = floor((low + high)/2)
    (left_low, left_high, left_sum) = max_subarray(A, low, mid)
    (right_low, right_high, right_sum) = max_subarray(A, mid+1, high)
    (cross_low, cross_high, cross_sum) =  max_crossing_subarray(A, low, mid, high)
    max_sum = max(left_sum, right_sum, cross_sum)
    if (max_sum == left_sum):
      return (left_low, left_high, left_sum)
    else if (max_sum == right_sum):
      return (right_low, right_high, right_sum)
    else:
      return (cross_low, cross_high, cross_sum)
{% endhighlight %}

### Walk-through
{% highlight python %}
For array [−2, 1, −3, 4, −1, 2, 1, −5, 4], mid would be 4 with left sub-array [−2, 1, −3, 4, -1] and right sub-array [2, 1, −5, 4]
mid = floor((0 + 8) / 2) = 4

i=4: sum = -1, left_sum = -1, max_left = 4
i=3: sum = 3, left_sum = 3, max_left = 3
i=2: sum = 0, left_sum = 3, max_left = 3
i=1: sum = 1, left_sum = 3, max_left = 3
i=0: sum = -1, left_sum = 3, max_left = 3

j=5: sum = 2, right_sum = 2, max_right = 5
j=6: sum = 3, right_sum = 3, max_right = 6
j=7: sum = -2, right_sum = 3, max_right = 6
j=8: sum = 2, right_sum = 3, max_right = 6

(max_left, max_right, left_sum + right_sum) = (3, 6, 3 + 3) = (3, 6, 6) which is [4, −1, 2, 1]
{% endhighlight %}