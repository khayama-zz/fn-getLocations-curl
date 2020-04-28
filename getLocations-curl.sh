#!/bin/bash
ARGS=$@
SL_USER=`echo "$ARGS" | jq -r '."SL_USER"'`
SL_APIKEY=`echo "$ARGS" | jq -r '."SL_APIKEY"'`
LOCATIONS=`curl -u "$SL_USER:$SL_APIKEY" -X GET 'https://api.softlayer.com/rest/v3.1/SoftLayer_Location/getViewablePopsAndDataCenters.json?objectMask=mask%5BlongName%2Cname%2ClocationAddress%5BlocationId%2Caddress1%2Caddress2%2Ccity%2Ccountry%2CisActive%2CpostalCode%2Cstate%2Ctype%5BkeyName%5D%5D%5D'`
echo "{ \"locations\": $LOCATIONS }"
