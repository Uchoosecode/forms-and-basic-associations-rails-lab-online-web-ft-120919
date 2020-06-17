class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre 
  has_many :notes 
  # add associations here
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_notes_attributes=(ids)
    ids.each do |note|
      # binding.pry
      self.notes.build(content: note)
    end
  end

end
