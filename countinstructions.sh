#!/bin/bash

user=cpu


specDir=/home/${user}/spec2000/CPU2000_install
curDir=`pwd`

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
300.twolf"

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

cd $specDir
source shrc
cd $curDir
echo "./RunAndKill.sh"
sleep 1
./RunAndKill.sh

if [ -d "instrs" ];then
	rm -rfv instrs/*
else
	mkdir instrs
fi
inthead=${specDir}/benchspec/CINT2000/
fphead=${specDir}/benchspec/CFP2000/
tail=/run/00000002

echo "****************************int*******************************" > ${curDir}/instrs/int.instr
for case in $INT
do
	casedir=${inthead}${case}${tail}
	echo $casedir
	cd $casedir
	echo $case >>  ${curDir}/instrs/int.instr
	#perf stat -e instructions:u ls 2>> ${curDir}/instrs/int.instr
	sed -i '3,$d' speccmds.cmd
	perf stat -e instructions:u specinvoke speccmds.cmd  2>> ${curDir}/instrs/int.instr
done


echo "****************************fp*******************************" > ${curDir}/instrs/fp.instr
for case in $FP
do
	casedir=${fphead}${case}${tail}
	echo $casedir
	cd $casedir
	echo $case >>  ${curDir}/instrs/fp.instr
	#perf stat -e instructions:u ls 2>> ${curDir}/instrs/fp.instr
	perf stat -e instructions:u specinvoke speccmds.cmd  2>> ${curDir}/instrs/fp.instr
done

