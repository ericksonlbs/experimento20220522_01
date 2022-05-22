#!/bin/bash
set -x

start=`date +%s%N`

java -javaagent:/jaguar/br.usp.each.saeg.jaguar.plugin/lib/jacocoagent.jar=output=tcpserver  \
            -cp \
            $1/target/classes/:$1/target/test-classes/:/jaguar/br.usp.each.saeg.jaguar.core/target/br.usp.each.saeg.jaguar.core-1.0.0-jar-with-dependencies.jar:/jaguar/br.usp.each.saeg.jaguar.plugin/lib/jacocoagent.jar \
            br.usp.each.saeg.jaguar.core.cli.JaguarRunner \
			--outputType "F" \
			--output "control-flow" \
			--projectDir "$1" \
			--classesDir "$1/target/classes/" \
			--testsDir "$1/target/test-classes/" \
			--testsListFile "$1/testListFile.txt"

end=`date +%s%N`
echo Execution time was `expr $end - $start` nanoseconds.