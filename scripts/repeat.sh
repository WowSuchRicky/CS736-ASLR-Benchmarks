#!/bin/bash

set -e
COUNT=100000

rm -f output.txt
for run in {1..$COUNT}
do
	rm -rf parent.txt child.txt
        $1 > /dev/null
done
