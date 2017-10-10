IP=192.16.0.13
MASK=20
SIZENET=$(( $MASK / 8 ))
echo "$SIZENET"
RANGE=$(echo $IP |cut -d "." -f 1-3)
echo "$RANGE"
