#Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).

def sum_to(n)
  return nil if n < 1
  return n if n == 1

  n + sum_to(n-1)
end

#Write a function add_numbers(nums_array) that takes in an array of Fixnums and returns the sum of those numbers. Write this method recursively.
def add_numbers(nums_array)
  return nums_array.first if nums_array.length <= 1 #need the < to account for when nums_array is [], which would then call .first and yield nil

  # nums_array.first + add_numbers(nums_array[1..-1]) => my way
  nums_array.pop + add_numbers(nums_array) #=> correct way
end

#Let's write a method that will solve Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!.
def gamma_fnc(n)
  return nil if n <= 0
  return 1 if n <= 2

  (n-1) * gamma_fnc(n-1)
end

#Write a function ice_cream_shop(flavors, favorite) that takes in an array of ice cream flavors available at the ice cream shop, as well as the user's favorite ice cream flavor. Recursively find out whether or not the shop offers their favorite flavor.

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.pop == favorite

  ice_cream_shop(flavors, favorite)
end

def reverse(str)
  return str if str.length <= 1
  str[-1] + reverse(str[0...-1])
end

if __FILE__ == $PROGRAM_NAME
  # Test Cases
  p sum_to(5) == 15  # => returns 15
  p sum_to(1) == 1 # => returns 1
  p sum_to(9) == 45 # => returns 45
  p sum_to(-8) == nil # => returns nil

  # Test Cases
 p add_numbers([1,2,3,4]) == 10 # => returns 10
 p add_numbers([3]) == 3# => returns 3
 p add_numbers([-80,34,7]) == -39 # => returns -39
 p add_numbers([]) == nil # => returns nil

 # Test Cases
  p gamma_fnc(0) == nil  # => returns nil
  p gamma_fnc(1) == 1  # => returns 1
  p gamma_fnc(4) == 6  # => returns 6
  p gamma_fnc(8) == 5040  # => returns 5040

  # Test Cases:
  p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon') == false
  p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea') == true
  p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio') == false
  p ice_cream_shop(['moose tracks'], 'moose tracks') == true
  p ice_cream_shop([], 'honey lavender')  == false

  # Test Cases:
  p reverse("house") == "esuoh"
  p reverse("dog") == "god"
  p reverse("atom") == "mota"
  p reverse("q") == "q"
  p reverse("id") == "di"
  p reverse("") == ""
end
