animals = ["cat", "kitty", "dog", "dog", "bunny", "walter", "dog", "parrot"]

def remove_dogs (array)
  array.delete("dog")
end

def remove_dogs2(animals)
  animals.delete_if do |animal|
    animal == "dog"
  end
    return animals
end

remove_dogs(animals)

puts animals
