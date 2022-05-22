#!/bin/bash
set -x

start=`date +%s%N`

java -cp '/flacoco/target/flacoco-1.0.6-SNAPSHOT-jar-with-dependencies.jar' fr.spoonlabs.flacoco.cli.FlacocoMain --projectpath $1

end=`date +%s%N`
echo Execution time was `expr $end - $start` nanoseconds.

