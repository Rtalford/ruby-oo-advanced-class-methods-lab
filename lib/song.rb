require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end 

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end 

  def self.create_by_name(song_name)
    song = self.new
    song.save
    song.name = song_name
    song
  end 

  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name
    }
  end 

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end 

  def self.new_from_filename(name)
    split_name = name.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = split_name[1]
    song.artist_name = split_name[0]
    song
  end 

  def self.create_from_filename(name)
    split_name = name.chomp(".mp3").split(" - ")
    song = Song.new
    song.name = split_name[1]
    song.artist_name = split_name[0]
    song.save
    song 
  end

  def self.destroy_all
    self.all.clear
  end 

end
