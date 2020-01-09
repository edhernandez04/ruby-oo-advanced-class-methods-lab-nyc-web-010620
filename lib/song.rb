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
    self.all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    @@all.find do |ele|
      ele.name == title
    end
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    sorted = @@all.sort_by {|title| title.name}
    sorted
  end

  def self.new_from_filename(filename)
    songs = filename.split("-")
    song = self.new
    song.name = songs[1].split(".")[0].strip
    song.artist_name = songs[0].strip
    song 
  end

  def self.create_from_filename(filename)
    songs = filename.split("-")
    song = self.create
    song.name = songs[1].split(".")[0].strip
    song.artist_name = songs[0].strip
    song 
  end

  def self.destroy_all
    self.all.clear
  end

end
