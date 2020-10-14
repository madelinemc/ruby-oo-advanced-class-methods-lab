class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all #this is for reading
    @@all
  end

  def save #instance method. self is the object but calling class method all 
    self.class.all << self
  end

  def self.create 
    song = self.new #this is where it is instatiating and saving the song with new
    song.save
    song
  end

  def self.new_by_name(song_name) #returns song instance with that name set as its name property. returns an instance of song, not just a string. 
    song = self.new
    song.name = song_name
    song
  end 

  def self.create_by_name(song_name) #returns song instance with name set as its name property and song saved in @@all
    song = self.new #instantiate new song
    song.name = song_name #instantiate by name
    song.save #save it
    song #return song
  end

  def self.find_by_name(name) #returns song instance with name set as its name property and song saved in @@all
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name) #either return matching song instance with that name or create a new song with the name and return the song instance. 
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else 
    #   self.create_by_name(name)
    # end
    self.find_by_name(name) || self.create_by_name(name) #above code refactored
  end

  def self.alphabetical #returns songs in ascending a-z order. use array.sort_by
    @@all.sort_by { |song| song.name } # sort by passes through the property and calls each one and sorts them. property of @@all is a song
  end

  def self.new_from_filename(filename) #class constructor. accepts filename in format of "-.mp3". constructor should return new song instance with song and artist name set.
    #must parse the input for relevant components. separate by - delimiter and remove .mp3
    split_filename = []
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end
  
  def self.create_from_filename(filename) #class constructor. accepts a filename in format of "-.mp3" should parse file name correctly and save new instance.
    split_filename = []
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = self.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save #have to use save method
    song
  end

  def self.destroy_all
    self.all.clear
    # or could use @@all = [] or @@all.clear
  end


end
