#!/bin/sh

SERVICE="espeak"

if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "running"
else
    espeak -v $1 "$2"  > /dev/null 2>&1  & 
fi
