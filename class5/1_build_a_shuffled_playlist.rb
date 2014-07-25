#!/usr/bin/env ruby
#
# 4 points
#
# Building a playlist is easy. It’s just a regular text file where each line is
# a path to file, like this:
#
#   songs/Autobiografia.mp3
#
# What makes it a playlist? Well, you have to give the file the .m3u extension,
# like playlist.m3u.
#
# Write a program that searches the songs/ directory for both .mp3 and .m4a
# files and then builds a valid playlist.m3u file. Use the `shuffle` method,
# described on page 75, to mix up the list of paths before saving them to the
# playlist.m3u file.
#
# Then open the playlist.m3u file in either iTunes or VLC. I'll be testing the
# playlist to ensure it actually works.
#
# Here's what the program should output to the shell:
#
#   $ ruby 1_build_a_shuffled_playlist.rb
#   => Build a shuffled playlist
#   => Created playlist.m3u with 16 songs
#
# A method you might find useful:
#
#   Dir[pattern] → Array
#
#     Using a pattern String, return an Array of file paths that match.
#
#     Dir["code/*.{rb,js}"]  #=> ["code/file1.rb", "code/file2.js"]

def create_playlist folder
  i = 0
  number_tracks = 0
  playlist = []
  number_tracks = folder.length

  while i < number_tracks
    track_number = i
    if folder[track_number] != ''
      playlist.push folder[track_number]
      folder[track_number] = ''
      i += 1
    else
    end
  end

filename = "playlist.m3u"
  File.open filename, "w" do |f|
    f.puts playlist.shuffle
  end
end

songs = Dir["*/*.{mp3,m4a}"]
create_playlist songs