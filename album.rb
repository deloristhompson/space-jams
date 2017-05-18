require_relative 'track'
require 'csv'

class Album
  attr_reader :id, :tracks, :summary, :duration_min
  def initialize(id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @duration_min = 0
    @tracks = []
  end

  def duration
    @tracks.each do |song|
      @duration_min += song[:duration_ms].to_f
    end
    @duration_min / (1000 * 60)
  end

  def summary
    summary = "\nName:#{@title} \nArtist(s): #{@artists} \nDuration (min) #{duration.round(2)} \nTracks:"
    @tracks.each_with_index do |song, index|
      summary += "\n-#{song[:title]}"
    end
    summary
  end
end

song =  Album.new('Track', 'Track', 'Track')
