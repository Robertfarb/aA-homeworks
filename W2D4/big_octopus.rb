fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
            'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def sluggish_octopus(arr)
  longest_fish = ""
  arr.each_index do |i1|
    arr.each_index do |i2|
      if arr[i1].length > arr[i2].length && arr[i1].length > longest_fish.length
        longest_fish = arr[i1]
      end
    end
  end
  longest_fish
end

# sluggish_octopus(fish_arr)


# dominant_octopus Θ(n log(n))
class Array
  def merge_sort(&prc)
    return self if length <= 1
    prc ||= Proc.new {|x, y| x.length <=> y.length}

    half_idx = length / 2
    left = self.take(half_idx).merge_sort(&prc)
    right = self.drop(half_idx).merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self. merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged + left + right
  end
end

# fish_arr.merge_sort.last

def clever_octopus(arr)

end
