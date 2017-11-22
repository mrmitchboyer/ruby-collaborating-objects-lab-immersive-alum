class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(self.path).find_all { |s| s.end_with?(".mp3")}
  end

  def import
    self.files.each do |song|
      data = song.split(" - ")
      name = data[0]
      title = data[1]
      genre = data[2].chomp(".mp3")

      artist = Artist.find_or_create_by_name(name)
      song = Song.new(title)
      artist.add_song(song)
    end
  end

end
