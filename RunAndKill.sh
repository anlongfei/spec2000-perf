#/bin/bash

#modify
user=alf
platform=950

specconfig=/home/${user}/spec2000/CPU2000_install/config
specbench=/home/${user}/spec2000/CPU2000_install/benchspec
INT="164.gzip     
     175.vpr    
     176.gcc    
     181.mcf    
     186.crafty 
     197.parser 
     252.eon    
     254.gap    
     253.perlbmk
     255.vortex
     256.bzip2 
     300.twolf "
FP="168.wupwise 
   171.swim    
   172.mgrid   
   173.applu   
   177.mesa    
   178.galgel  
   179.art     
   183.equake  
   187.facerec 
   188.ammp    
   189.lucas   
   191.fma3d   
   200.sixtrack
   301.apsi"

cd $specconfig
source ../shrc

find ${specbench} -name exe -exec rm -rfv {} \;
find ${specbench} -name run -exec rm -rfv {} \;

runspec -c pmc-${platform}-O3.cfg --action setup all 

echo $INT
for case in $INT
do
	case=${case%.*}
	echo $case
	runspec -c pmc-${platform}-O3.cfg -n 1 --noreportable $case &
	sleep 2
	ps -ef | grep cpu_O3 | awk '{print $2}' | xargs kill -9
done

for i in 1 2 3 4 5
do
	echo $i
	ps -ef | grep cpu_O3 | awk '{print $2}' | xargs kill -9
done


echo $FP
for case in $FP
do
	case=${case%.*}
	echo $case
	runspec -c pmc-${platform}-O3.cfg -n 1 --noreportable $case &
	sleep 1
	ps -ef | grep cpu_O3 | awk '{print $2}' | xargs kill -9
done
	
for i in 1 2 3 4 5
do
	echo $i
	ps -ef | grep cpu_O3 | awk '{print $2}' | xargs kill -9
done
sleep 5
