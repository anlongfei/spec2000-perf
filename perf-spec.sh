#!/bin/bash
specDir=/home/alf/spec2000/CPU2000_install
curDir=`pwd`

# 1. first run spec2000
cd $curDir
echo " ------->>>>>>> run RunAndKill.sh ..."
sleep 2
./RunAndKill.sh
cd $specDir
source shrc

# 2.pmc_name umask event
# name					   umask 	       event
array_pmc=(
"DTLB_LOAD_MISSES.ANY"                      "01"		"08"		## 0
"DTLB_LOAD_MISSES.WALK_COMPLETED"           "02"		"08"		## 1
"DTLB_LOAD_MISSES.STLB_HIT"                 "10"		"08"		## 2
"UOPS_ISSUED.ANY"                           "01"		"0E"		## 3
"UOPS_ISSUED.STALLED_CYCLES"                "01"		"0E"		## 4
"LOAD_DISPATCH.RS"                          "01"		"13"		## 5
"LOAD_DISPATCH.MOB"                         "04"		"13"		## 6
"L2_RQSTS.MISS"                   	    "AA"		"24"		## 7
"L2_RQSTS.REFERENCES"                       "FF"		"24"		## 8
"L2_RQSTS.RFOS"                             "0C"		"24"		## 9
"L3_LAT_CACHE.REFERENCE"                    "4F"		"2E"		## 10
"L3_LAT_CACHE.MISS"                         "41"		"2E"		## 11
"CPU_CLK_UNHALTED.THREAD_P"                 "00"		"3C"		## 12
"L1D_ALL_REF.ANY"                           "01"		"43"		## 13
"DTLB_MISSES.ANY"                           "01"		"49"		## 14
"L1I.HITS"                                  "01"		"80"		## 15
"L1I.MISSES"                                "02"		"80"		## 16
"L1I.CYCLES_STALLED"                        "04"		"80"		## 17
"ITLB_MISSES.ANY"                           "01"		"85"		## 18
"ILD_STALL.ANY"                             "0F"		"87"		## 19
"ITLB_FLUSH"                                "01"		"AE"		## 20
"BR_MISP_RETIRED.ALL_BRANCHES"              "00"		"C5"		## 21
"INST_RETIRED.ANY_P"                        "00"		"C0"		## 22
"BR_INST_RETIRED.ALL_BRANCHES"              "00"		"C4"		## 23
"MEM_LOAD_RETIRED.L3_MISS"                  "10"		"CB"		## 24
"RESOURCE_STALLS.RS_FULL"                   "04"		"A2"		## 25
"L2_LINES_OUT.ANY"                          "0F"		"F2"		## 26
"UNC_L3_LINES_OUT.ANY"                      "1F"		"0B"		## 27
)

# 3. data dir
cd $curDir

if [ -d "CPU2000" ];then
	rm CPU2000/* -rfv
else
	mkdir CPU2000
fi

cd CPU2000
dataDir=`pwd`

# 4. run INT
echo " ------->>>>>>> run INT ..."
sleep 2
i=0
k=3
specDir=${specDir}"/benchspec/CINT2000/"
while true
do
	#index=`expr $i\*$k`
	index=$(($i * 3))
	pmc_name=${array_pmc[$(($index + 0))]}
	umask=${array_pmc[$(($index + 1))]}
	event=${array_pmc[$(($index + 2))]}
	echo "index"  $index
	echo "pmc_name" $pmc_name
	echo "umask"  $umask
	echo "event"  $event

	#pwd
	destDir=`find ${specDir} -name 00000002`
	echo $specDir
	len=`expr length ${specDir}`
	echo $len
	echo "***********************int data***************************" >  ${dataDir}/int.${pmc_name}
	echo "" >>  ${dataDir}/int.${pmc_name}
	
	for dest in $destDir
	do
		case=${dest:$len}
		case=${case%/*}
		case=${case%/*}
		echo $case
		
		echo $dest
		cd $dest
		echo "====================================================================================="
		echo "=====================================================================================" >>  ${dataDir}/int.${pmc_name}
		echo $dest >>  ${dataDir}/int.${pmc_name}
		echo $case >>  ${dataDir}/int.${pmc_name}
		perf stat -e r${umask}${event} specinvoke  speccmds.cmd 2>> ${dataDir}/int.${pmc_name}
	done
	
	
	
	i=$(($i + 1))
	if [ $i -eq 28 ] ;then
		echo "done !"
		sleep 2
		break	
	fi
done

# 4. run FP
echo " ------->>>>>>> run FP ..."
sleep 2
i=0
k=3
specDir=/home/alf/spec2000/CPU2000_install
specDir=${specDir}"/benchspec/CFP2000/"
while true
do
	#index=`expr $i\*$k`
	index=$(($i * 3))
	pmc_name=${array_pmc[$(($index + 0))]}
	umask=${array_pmc[$(($index + 1))]}
	event=${array_pmc[$(($index + 2))]}
	echo "index"  $index
	echo "pmc_name" $pmc_name
	echo "umask"  $umask
	echo "event"  $event

	#pwd
	destDir=`find ${specDir} -name 00000002`
	echo $specDir
	len=`expr length ${specDir}`
	echo $len
	echo "***********************fp data***************************" >  ${dataDir}/fp.${pmc_name}
	echo "" >>  ${dataDir}/fp.${pmc_name}
	
	for dest in $destDir
	do
		case=${dest:$len}
		case=${case%/*}
		case=${case%/*}
		echo $case
		
		echo $dest
		cd $dest
		echo "====================================================================================="
		echo "=====================================================================================" >>  ${dataDir}/fp.${pmc_name}
		echo $dest >>  ${dataDir}/fp.${pmc_name}
		echo $case >>  ${dataDir}/fp.${pmc_name}
		perf stat -e r${umask}${event} specinvoke  speccmds.cmd 2>> ${dataDir}/fp.${pmc_name}
	done
	
	
	
	i=$(($i + 1))
	if [ $i -eq 28 ] ;then
		echo "done !"
		sleep 2
		break	
	fi
done


