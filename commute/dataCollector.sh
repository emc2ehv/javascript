#!/bin/bash

outputLocation=$1
key=$2
from=$3
to=$4
toLM=`curl -s "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=${from}&destinations=${to}&departure_time=now&key=${key}" | jq .rows[0].elements[0].duration_in_traffic.value`
fromLM=`curl -s "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=${to}&destinations=${from}&departure_time=now&key=${key}" | jq .rows[0].elements[0].duration_in_traffic.value`
echo -e "`date`,${toLM},${fromLM}" >> ${outputLocation}
