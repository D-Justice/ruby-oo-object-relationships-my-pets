class Owner
  attr_reader :name, :species
  attr_accessor :cats

  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    @cats = []
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def pets_for_owner(pet)
    pet.all.select {|each| each.owner == self}
  end

  def cats
    pets_for_owner(Cat)
  end

  def dogs
    pets_for_owner(Dog)
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end
  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    Dog.all.each {|instance| instance.mood = 'happy'}
  end

  def feed_cats
    Cat.all.each {|instance| instance.mood = 'happy'}
  end

  def sell_pets
    pets = self.dogs + self.cats

    pets.each do |instance|
      instance.mood = 'nervous'
      instance.owner = nil
    end
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end