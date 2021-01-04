require 'pry'

class Artist
  attr_accessor :name
  
  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name (artist_name)
    artist = @@all.find {|art_inst| art_inst.name == artist_name}
    artist = self.new(artist_name) if artist.nil?
    artist
  end

  def print_songs
    artist_songs = Song.all.select {|song| song.artist == self}
    artist_songs.each {|song| puts "#{song.name}\n"}
  end

  def self.all
    @@all
  end

end