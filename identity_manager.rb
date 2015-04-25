$heroes = []

def add_hero(name, secret_identity, weakness)
  $heroes << {
    name: name,
    secret_identity: secret_identity,
    weakness: weakness
    }
  "Hero Added"
end

# List current superheroes
def list_heroes
  if $heroes.count < 1
    puts "\nNo heroes to display"
  else
    puts "\n"
    $heroes.each do |hero|
      puts hero[:name]
    end
  end
  call_methods
end

# List current superheroes and secret identities
def list_heroes_full
  if $heroes.count < 1
    puts "\nNo heroes to display"
  else
    $heroes.each do |hero|
      puts "\nName: #{hero[:name]}
Secret Identity: #{hero[:secret_identity]}
Weakness: #{hero[:weakness]}\n"
    end
  end
call_methods
end

# Verify password
def authorization
  print "\nPlease enter the password\n=> "
  password = gets.chomp
  if password == "Ruby"
    list_heroes_full
  else 
    puts "That is the incorrect password"
    list_heroes
  end
end

# Add a new superhero
def create_hero
  print "\nEnter a superhero name\n=> "
  name = gets.chomp
  print "Enter a secret identity\n=> "
  secret_identity = gets.chomp
  print "Enter a weakness\n=> "
  weakness = gets.chomp
  add_hero(name, secret_identity, weakness) 
  puts "#{name} added"
  call_methods
end

# Remove a fallen superhero
def remove_hero
  puts "What is the name of the fallen hero?"
  name = gets.chomp
  $heroes.reject! {|hero| hero[:name].downcase == name.downcase}
  puts "RIP #{name}"
  call_methods
end

# Output main menu
def menu
  print "\n------------------------------------------------------------
Would you like to:
  1. List Superheroes
  2. List Superheroes with their secret identities
  3. Add a new Superhero
  4. Remove fallen superheroes
  5. Exit
------------------------------------------------------------\n=> "
  choice = gets.chomp
  return choice
end

# Call functions based on choice
def call_methods
  choice = menu
  if choice == "1"
    list_heroes
    elsif choice == "2"
      authorization
      elsif choice == "3"
        create_hero
        elsif choice == "4"
          remove_hero
          elsif choice == "5"
            exit
            else
              print "Incorrect input"
              call_methods
  end
end

call_methods
