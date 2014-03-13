require 'rspec'
require 'zoo'
require 'animal'
require 'species'
require 'climate'
require 'klass'


describe Zoo do


  it 'holds all the animals in an array' do
    new_zoo = Zoo.new
    new_zoo.should be_an_instance_of Zoo
  end
  it 'initializes with an empty array for animals' do
    new_zoo = Zoo.new
    new_zoo.all_animals.should eq []
  end
   it 'initializes with an empty array for climates' do
    new_zoo = Zoo.new
    new_zoo.climates.should eq []
  end
   it 'initializes with an empty array for klasses' do
    new_zoo = Zoo.new
    new_zoo.klasses.should eq []
  end
end

describe Animal do

  before do
    Animal.clear
  end


  describe 'initialize' do
    it 'creates a new instance of Animal with details' do
      new_species = Species.new('lion')
      new_climate = Climate.new('savannah')
      new_klass = Klass.new('mammal')
      new_animal = Animal.new(new_species, new_climate, new_klass)
      new_animal.should be_an_instance_of Animal
    end
  end

  describe '.all' do
    it 'is empty at first' do
      Animal.all.should eq []
    end
  end

  describe '#save' do
    it 'adds to @@all_animals' do
      new_species = Species.new('lion')
      new_climate = Climate.new('savannah')
      new_klass = Klass.new('mammal')
      new_animal = Animal.create(new_species, new_climate, new_klass)
      Animal.all.should eq [new_animal]
    end
  end
end
