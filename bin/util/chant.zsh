#!/bin/zsh
# chant.zsh
#
# Play a selection of Gregorian chant on a loop to keep away demons.
#

# List of songs to play
songs=(
    '/mnt/d1/kyle/Music/[anonymous]/Ave Maria'/*.flac
    '/mnt/d1/kyle/Music/[anonymous]/Salve Regina_ Gregorian Chant'/*.flac
)
mpv_opts=(--loop-playlist --shuffle --no-audio-display)

# Make sure mpv is installed
mpv --version > /dev/null || exit 1

echo "Playlist:"
for (( i = 1; i <= $#songs; i++ )) do
    printf '%i\t%s\n' $i $songs[i]
done
echo ""

mpv $mpv_opts $songs
