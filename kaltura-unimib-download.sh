#!/bin/bash

#prepare the setup
mkdir -p tmp
mkdir -p output

rm -f tmp/*

## options for video downloads:
#
#   -h: hours
#   -m: minutes 
#   -s: seconds 
#   -l: full qualified link
#   -o: output filename
#   -f: file format output
#
##############################
#FORMAT="mp4"

while getopts :h:m:s:o:f:l: option
    do
        case "${option}" in
            h) HOURS=${OPTARG};;
	    m) MINUTES=${OPTARG};;
	    s) SECONDS=${OPTARG};;
            o) OUTNAME=${OPTARG};;
            f) FORMAT=${OPTARG};;
	    l) LINK=${OPTARG};;
	    #[?]) print >&2 "Usage: $0 [-s] [-d seplist] file ..." exit 1;;
    esac
done

yum info ffmpeg $> /dev/null

#if FFMPEG is missing, exit with code 1
if [ $? -eq 1 ]; then
    echo "FFMPEG is missing!"
    exit 1
fi

#getting segment of videos making DURATION / 10

DURATION=$((SECONDS + 60 * MINUTES + 3600 * HOURS))

SEGMENTS=$((DURATION / 10 + 9))

sleep 1

#debug 
    echo 'Duration: ' $DURATION
    echo 'Segments number: ' $SEGMENTS
    echo 'Link: ' $LINK
    echo 'Output filename: ' $OUTNAME
    echo 'Video file format: ' $FORMAT

read -n 1 -s -r -p "Press any key to continue"

echo " "
echo "Be patient..."

#download single section one by one
SECT=$( echo "$LINK" | grep -o 'seg-[[:digit:]]*-v1-a1.ts*' )
TMPSTR=$LINK
for (( i=1; i<SEGMENTS; i++ )) do
	TMPSTR=${LINK/$SECT/seg-$i-v1-a1.ts}
	#echo $TMPSTR
	ffmpeg -i "$TMPSTR" -c copy tmp/$i.$FORMAT 2> /dev/null
done

#make sorted.txt file with all video segment
ls -ltr tmp/ | grep -o '[[:digit:]]*.mp4' > sorted.txt

#add prefix word 'tmp/file' on each lines

sed -i -e 's/^/file tmp\//' sorted.txt

#merge all segments with ffmpeg

ffmpeg -f concat -safe 0 -i sorted.txt -c copy output/$OUTNAME.$FORMAT 2> /dev/null

#delete segment files
rm -f tmp/*

echo "Done. Your file is in output/ as $OUTNAME.$FORMAT."



