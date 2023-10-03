#!/usr/bin/env bash

for i in {1..5}; do
   echo "-- Running step $i"
   sleep 1
done

echo "This job encountered an error." 1>&2

exit 100