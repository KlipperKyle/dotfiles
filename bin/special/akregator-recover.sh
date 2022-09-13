#!/bin/sh
# akregator-recover.sh
#
# Originally from
# http://piao-tech.blogspot.com/2007/03/lost-your-akregator-feed-list-get-it.html

cd ~/.kde/share/apps/akregator/Archive || exit 1

for i in http*mk4; do

    feed=`echo $i | sed -e 's|http___https___|https://|' \
    	       	    	-e 's|http___|http://|' \
			-e 's|https___|https://|' \
		       	-e 's|_|/|g' \
		      	-e 's|.mk4||'`
    echo "Adding $feed"
    `akregator -a $feed`
done
