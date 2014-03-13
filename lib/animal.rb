class Animal
  attr_reader :species, :climate, :klass
#we know it's spelled 'class', but it's an unfortunate confusion.

  @@all_animals = []

  def initialize(species, climate, klass)
    @species = species
    @climate = climate
    @klass = klass
  end

  def Animal. create(species, climate, klass)
    new_animal = Animal.new(species, climate, klass)
    new_animal.save
    new_animal
  end


  def Animal.all
    @@all_animals
  end

  def save
    @@all_animals << self
  end

  def Animal.clear
    @@all_animals = []
  end

end
