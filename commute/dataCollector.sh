#!/bin/bash

outputLocation=$1
key=$2
toLM=`curl -s "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=216+Armata+Drive+Middletown+DE&destinations=750+Centerton+Road+Mount+Laurel+NJ&departure_time=now&key=${key}" | jq .rows[0].elements[0].duration_in_traffic.value`
fromLM=`curl -s "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=750+Centerton+Road+Mount+Laurel+NJ&destinations=216+Armata+Drive+Middletown+DE&departure_time=now&key=${key}" | jq .rows[0].elements[0].duration_in_traffic.value`
echo -e "`date`,${toLM},${fromLM}" >> ${outputLocation}
