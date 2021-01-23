class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = self.new
    song.save
    song
  end

  def Song.new_by_name(names)
    song_name= self.new
    song_name.name = names
    song_name
    
  end

  def Song.create_by_name(names)
    saved_name = self.new
    saved_name.name = names
    saved_name.save
    saved_name
  end

  def Song.find_by_name(name)
    @@all.find {|person| person.name == name}
  
  end

  def Song.find_or_create_by_name(name)
     if self.find_by_name(name) == nil
        self.create_by_name(name)
     else
      self.find_by_name(name)
      end

  end

  def Song.alphabetical
    @@all.sort_by {|a| a.name}
  end

  def Song.new_from_filename(filename)
   file = filename.split(" - ")
   name = file[1].split(".")[0]
   song_name= self.new
   song_name.name = name
   song_name.artist_name = file[0]
    song_name
  end

  def Song.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def Song.destroy_all
    Song.all.clear
  end
  
end
