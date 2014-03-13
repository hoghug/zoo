require './lib/zoo'
require './lib/klass'
require './lib/animal'
require './lib/species'
require './lib/climate'

def main_menu
  system('clear')
  puts "A: add animal, L: List animals, E: list exhibits, S: search animals"
  user_command = gets.chomp.downcase
  case user_command
  when 'a'
    add_animal
  when 'l'
    list_animals
  when 'e'
    edit_menu
  when 's'
    search_menu
  else
    puts "Invalid option"
    main_menu
  end
end


def add_animal
  puts "What is the species of the animal you would like to add? (Ex. 'lion', 'rhinoceros')\n"
  species = gets.chomp
  puts "\nWhat is the class of the animal you are entering? (Ex. 'amphibian', 'mammal')\n"
  klass = gets.chomp
  puts"\nWhat is the climate this animal lives in? (Ex. 'desert', 'forest', 'jungle')\n"
  climate = gets.chomp
  new_species = Species.new(species)
  new_climate = Climate.new(climate)
  new_klass = Klass.new(klass)
  new_animal = Animal.create(new_species, new_klass, new_climate)
  puts "You have entered the new animal '#{new_species.value}' which is in the class '#{new_klass.value}' and lives in the #{new_climate.value}!\n\n"
  if new_species.value == 'lion'
    lion_key
  end
  puts "Press any key to return to the main menu.\n"
  gets.chomp
  main_menu
end

def list_animals
  puts "Here is a list of all the animals in this zoo: \n"
  puts "---------------------------------------------------- \n"
  Animal.all.each_with_index do |animal, index|
    puts "#{index+1}.\tAnimal: #{animal.species.value}\n\tClass: #{animal.klass.value}\n\tClimate: #{animal.climate.value}\n"
    breaker
    end
  puts "---------------------------------------------------- \n"
  puts "Press any key to return to the main menu.\n"
  gets.chomp
  main_menu
end

def search_menu
  puts "What are you searching for?"
  search_results = []
  search_term = gets.chomp
  Animal.all.each_with_index do |animal, index|
    if animal.species.value == search_term || animal.climate.value == search_term || animal.klass.value == search_term
      search_results << animal
    end
  end
  if search_results.length > 0
    search_results.each_with_index do |animal, index|
    puts "#{index+1}.\tAnimal: #{animal.species.value}\n\tClass: #{animal.klass.value}\n\tClimate: #{animal.climate.value}\n"
    breaker
    end
  else
    puts "No matches found"
    search_menu
  end

end

def edit_menu
  puts "Please press the number of the listing you would like to edit.\n\n"
  Animal.all.each_with_index do |animal, index|
    puts "#{index+1}.\tAnimal: #{animal.species.value}\n\tClass: #{animal.klass.value}\n\tClimate: #{animal.climate.value}\n"
  end
  entry = gets.chomp.to_i
  puts "What is the animal's new species?\n"
  user_species = gets.chomp
  Animal.all[entry-1].species.value = user_species
  puts "What is the animal's new class?\n"
  user_klass = gets.chomp
  Animal.all[entry-1].klass.value = user_klass
  puts "What is the animal's new climate?\n"
  user_climate = gets.chomp
  Animal.all[entry-1].climate.value = user_climate
  puts "The edited entry for #{user_species} is:\n\n"
  puts "\tAnimal: #{Animal.all[entry-1].species.value}\nClass: #{Animal.all[entry-1].klass.value}\n\tClimate: #{Animal.all[entry-1].climate.value}\n"
  puts "\nPress any key to go to the main menu.\n"
  gets.chomp
  main_menu
end

def breaker
  puts "*" * 60
end


def lion_key
  print "             ,%%%%%%%%,
           ,%%/\%%%%/\%%
          ,%%%\c "" J/%%%
 %.       %%%%/ o  o \%%%
 `%%.     %%%%    _  |%%%
  `%%     `%%%%(__Y__)%%'
  //       ;%%%%`\-/%%%'
 ((       /  `%%%%%%%'
  \\    .'          |
   \\  /       \  | |
    \\/         ) | |
     \         /_ | |__
     (___________)))))))"
end

add_animal
