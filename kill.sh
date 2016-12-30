#/bin/bash
index=0
while true
do
	echo $index
	sleep 0.01
	ps -ef | grep cpu_O3 | awk '{print $2}' | xargs kill -9
	index=$((index + 1))
done
sleep 2
