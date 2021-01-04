require 'pry'

class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(song_title)
    @name = song_title
    save
  end

  def save
    @@all << self
  end

  def artist_name=(artist)
    @artist = Artist.find_or_create_by_name(artist)
  end

  def self.all
    @@all
  end

  def self.new_by_filename(file)
    arr = file.split(" - ")
    artist = arr[0]
    song = arr[1]
    new_song = self.new(song)
    new_song.artist_name = (artist)
    new_song
  end

end