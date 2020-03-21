#!/bin/bash

outputLocation=$1
toLM=`curl -s "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=216+Armata+Drive+Middletown+DE&destinations=750+Centerton+Road+Mount+Laurel+NJ&departure_time=now&key=AIzaSyCQOs46068tRhUE4scmgZLqIX-15Ut_MF4" | jq .rows[0].elements[0].duration_in_traffic.value`
fromLM=`curl -s "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=750+Centerton+Road+Mount+Laurel+NJ&destinations=216+Armata+Drive+Middletown+DE&departure_time=now&key=AIzaSyCQOs46068tRhUE4scmgZLqIX-15Ut_MF4" | jq .rows[0].elements[0].duration_in_traffic.value`
echo -e "`date`,${toLM},${fromLM}" >> ${outputLocation}
