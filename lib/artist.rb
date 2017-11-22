class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def self.find_or_create_by_name(name)
    if find_artist(name)
      find_artist(name)
    else
      name = self.new(name)
    end
  end

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    song.artist = self
    @songs << song
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def print_songs
    self.songs.each { |s| puts s.name  }
  end

  private

  def self.find_artist(name)
    all.detect { |a| a.name == name }
  end

end
