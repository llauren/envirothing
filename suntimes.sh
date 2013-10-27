#!/bin/bash

RCFILE="envirothing.rc"

[ -f "$RCFILE" ] && . $RCFILE

[ -z "$API_KEY" ] && {
	echo "Create a file $RCFILE with the line API_KEY=\"<your Wunderground API key>\""
	exit 1
}

[ -z "$LOCATION" ] && {
	JSON=$( curl -O location.json "http://api.wunderground.com/api/${API_KEY}/geolookup/q/autoip.json" )
	JSON=$( cat location.json )

	#LON=$( echo "$JSON" | grep \"lon\" | head -1 | cut -f 4 -d \" )
	#LAT=$( echo "$JSON" | grep \"lat\" | head -1 | cut -f 4 -d \" )
	
	COUNTRY=$( echo "$JSON" | grep \"country\" | head -1 | cut -f 4 -d \" )
	CITY=$( echo "$JSON" | grep \"city\" | head -1 | cut -f 4 -d \" )
	LOCATION=${COUNTRY}/${CITY}
	echo "LOCATION=${COUNTRY}/${CITY}" >> envirothing.rc 
}

# echo "You are probably in: ${LOCATION}"

TODAY=$( date +%m%d )
[ -f "suntimes" ] && . suntimes
[ -z "${SUNRISE[$TODAY]}" ] && {
        JSON=$( curl "http://api.wunderground.com/api/${API_KEY}/astronomy/q/${LOCATION}.json" )
	RISE_HOUR=$( echo "$JSON" |  grep -A 2 sunrise | head -2 | tail -1 | cut -f 4 -d \" )
	RISE_MINUTE=$( echo "$JSON" | grep -A 2 sunrise | head -3 | tail -1 | cut -f 4 -d \" )
	
        SET_HOUR=$( echo "$JSON" |  grep -A 2 sunset | head -2 | tail -1 | cut -f 4 -d \" )
        SET_MINUTE=$( echo "$JSON" | grep -A 2 sunset | head -3 | tail -1 | cut -f 4 -d \" )

	echo "SUNRISE[${TODAY}]=`printf %02d ${RISE_HOUR}``printf %02d ${RISE_MINUTE}`" >> suntimes
	echo "SUNSET[${TODAY}]=`printf %02d ${SET_HOUR}``printf %02d ${SET_MINUTE}`" >> suntimes
}

# echo "Sunrise at $SUNRISE"
 
#	JSON=$( curl "http://api.wunderground.com/api/${API_KEY}/astronomy/q/${LOCATION}.json" )

