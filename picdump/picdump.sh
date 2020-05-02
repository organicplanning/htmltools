#!/bin/bash
## script URL: https://github.com/organicplanning/htmltools/picdump/picdump.sh
## expected picture name: caption1_caption2_doesntmatter.fileextension
## caption will be "caption1 caption2" then

indir=gfx
outdir=html
outfile=$outdir/pictures.html

#############################################################

cat <<END-OF-HEADER | tee $outfile
<!DOCTYPE html>
<html>

<head>
  <title>Page Title</title>
</head>

<body>
END-OF-HEADER

############################################################

ls -1 $indir | while read a;
  do 
    b=$(echo $a | cut -f 1  -d "_")
    c=$(echo $a | cut -f 2  -d "_")
    echo "  <br /><br /><figure><img src=\"../$indir/$a\"><figcaption>$b $c</figcaption></figure>" | tee -a $outfile;
  done

###########################################################

cat <<END-OF-FOOTER | tee -a $outfile

</body>

</html> 
END-OF-FOOTER

###########################################################

# to test:
firefox --no-remote -p htmltest $outfile


