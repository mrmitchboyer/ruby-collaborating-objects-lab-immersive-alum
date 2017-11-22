class Song
  attr_accessor :name, :artist

  def self.new_by_filename(filename)
    data = filename.split(" - ")
    name = data[0]
    title = data[1]
    genre = data[2].chomp(".mp3")

    artist = Artist.find_or_create_by_name(name)
    song = self.new(title)
    artist.add_song(song)
    song
  end

  def initialize(name)
    @name = name
  end
end
