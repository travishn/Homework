require 'byebug'
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.
# fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#=> "fiiiissshhhhhh"

def quadratic_eat(fish_arr)
  # byebug
  current_max = nil

  fish_arr.each_with_index do |fish, idx|
    current_max = fish if current_max.nil?

    fish_arr.each_with_index do |fish2, idx2|
      next if idx == idx2
      current_max = fish2 if fish2.length > current_max.length
    end
  end

  current_max
end

class Array
  def merge_sort(&prc)
    return self if count <= 1
    prc ||= Proc.new { |x, y| x <=> y }

    mid_idx = self.length / 2
    sorted_left = self[0...mid_idx].merge_sort(&prc)
    sorted_right = self[mid_idx..-1].merge_sort(&prc)

    merge(sorted_left, sorted_right, &prc)
  end
end

def merge(left, right, &prc)
  sorted = []

  until left.empty? || right.empty?
    case prc.call(left[0], right[0])
    when -1
      sorted << left.shift
    when 0
      sorted << right.shift
    when 1
      sorted << right.shift
    end
  end

  sorted + left + right
end

def nlogn_eat(fish_arr)
  prc = Proc.new { |x, y| x.length <=> y.length }
  fish_arr.merge_sort(&prc).last
end

def linear_eat(fish_arr)
  current_biggest = fish_arr[0]

  fish_arr.each do |fish|
    current_biggest = fish if fish.length > current_biggest.length
  end

  current_biggest
end

def slow_dance(direction, tiles_arr)
  tiles_arr.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
