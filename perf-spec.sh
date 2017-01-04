#!/bin/bash
specDir=/home/cpu/spec2000/CPU2000_install
curDir=`pwd`

# 1. first run spec2000
cd $curDir
echo " ------->>>>>>> run RunAndKill.sh ..."
sleep 2
# RunAndKill
#./RunAndKill.sh

# deal cmds
#./dealcmds.sh
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
fi
mkdir CPU2000


cd CPU2000
dataDir=`pwd`

# 4. run INT
echo " ------->>>>>>> run INT ..."
sleep 2
i=0
k=3
	index=$(($i * 3))

	pmc_name0=${array_pmc[$(($index + 0))]}
	umask0=${array_pmc[$(($index + 1))]}
	event0=${array_pmc[$(($index + 2))]}

	pmc_name1=${array_pmc[$(($index + 3))]}
	umask1=${array_pmc[$(($index + 4))]}
	event1=${array_pmc[$(($index + 5))]}

	pmc_name2=${array_pmc[$(($index + 6))]}
	umask2=${array_pmc[$(($index + 7))]}
	event2=${array_pmc[$(($index + 8))]}

	pmc_name3=${array_pmc[$(($index + 9))]}
	umask3=${array_pmc[$(($index + 10))]}
	event3=${array_pmc[$(($index + 11))]}

	pmc_name4=${array_pmc[$(($index + 12))]}
	umask4=${array_pmc[$(($index + 13))]}
	event4=${array_pmc[$(($index + 14))]}

	pmc_name5=${array_pmc[$(($index + 15))]}
	umask5=${array_pmc[$(($index + 16))]}
	event5=${array_pmc[$(($index + 17))]}

	pmc_name6=${array_pmc[$(($index + 18))]}
	umask6=${array_pmc[$(($index + 19))]}
	event6=${array_pmc[$(($index + 20))]}

	pmc_name0=${array_pmc[$(($index + 21))]}
	umask7=${array_pmc[$(($index + 22))]}
	event7=${array_pmc[$(($index + 23))]}

	pmc_name1=${array_pmc[$(($index + 24))]}
	umask8=${array_pmc[$(($index + 25))]}
	event8=${array_pmc[$(($index + 26))]}

	pmc_name2=${array_pmc[$(($index + 27))]}
	umask9=${array_pmc[$(($index + 28))]}
	event9=${array_pmc[$(($index + 29))]}

	pmc_name3=${array_pmc[$(($index + 30))]}
	umask10=${array_pmc[$(($index + 31))]}
	event10=${array_pmc[$(($index + 32))]}

	pmc_name4=${array_pmc[$(($index + 33))]}
	umask11=${array_pmc[$(($index + 34))]}
	event11=${array_pmc[$(($index + 35))]}

	pmc_name5=${array_pmc[$(($index + 36))]}
	umask12=${array_pmc[$(($index + 37))]}
	event12=${array_pmc[$(($index + 38))]}

	pmc_name6=${array_pmc[$(($index + 39))]}
	umask13=${array_pmc[$(($index + 40))]}
	event13=${array_pmc[$(($index + 41))]}

	pmc_name0=${array_pmc[$(($index + 42))]}
	umask14=${array_pmc[$(($index + 43))]}
	event14=${array_pmc[$(($index + 44))]}

	pmc_name1=${array_pmc[$(($index + 45))]}
	umask15=${array_pmc[$(($index + 46))]}
	event15=${array_pmc[$(($index + 47))]}

	pmc_name2=${array_pmc[$(($index + 48))]}
	umask16=${array_pmc[$(($index + 49))]}
	event16=${array_pmc[$(($index + 50))]}

	pmc_name3=${array_pmc[$(($index + 51))]}
	umask17=${array_pmc[$(($index + 52))]}
	event17=${array_pmc[$(($index + 53))]}

	pmc_name4=${array_pmc[$(($index + 54))]}
	umask18=${array_pmc[$(($index + 55))]}
	event18=${array_pmc[$(($index + 56))]}

	pmc_name5=${array_pmc[$(($index + 57))]}
	umask19=${array_pmc[$(($index + 58))]}
	event19=${array_pmc[$(($index + 59))]}

	pmc_name6=${array_pmc[$(($index + 60))]}
	umask20=${array_pmc[$(($index + 61))]}
	event20=${array_pmc[$(($index + 62))]}

	pmc_name0=${array_pmc[$(($index + 63))]}
	umask21=${array_pmc[$(($index + 64))]}
	event21=${array_pmc[$(($index + 65))]}

	pmc_name1=${array_pmc[$(($index + 66))]}
	umask22=${array_pmc[$(($index + 67))]}
	event22=${array_pmc[$(($index + 68))]}

	pmc_name2=${array_pmc[$(($index + 69))]}
	umask23=${array_pmc[$(($index + 70))]}
	event23=${array_pmc[$(($index + 71))]}

	pmc_name3=${array_pmc[$(($index + 72))]}
	umask24=${array_pmc[$(($index + 73))]}
	event24=${array_pmc[$(($index + 74))]}

	pmc_name6=${array_pmc[$(($index + 75))]}
	umask25=${array_pmc[$(($index + 76))]}
	event25=${array_pmc[$(($index + 77))]}

	pmc_name6=${array_pmc[$(($index + 78))]}
	umask26=${array_pmc[$(($index + 79))]}
	event26=${array_pmc[$(($index + 80))]}

	pmc_name4=${array_pmc[$(($index + 80))]}
	umask27=${array_pmc[$(($index + 82))]}
	event27=${array_pmc[$(($index + 83))]}

	pmc_name5=${array_pmc[$(($index + 84))]}
	umask28=${array_pmc[$(($index + 85))]}
	event28=${array_pmc[$(($index + 86))]}





specDir=${specDir}"/benchspec/CINT2000/"
while true
do
	index=$(($i * 3))
	#index=`expr $i\*$k`
	echo "index"  $index
	echo "pmc_name" $pmc_name
	echo "umask"  $umask
	echo "event"  $event

	#pwd
	destDir=`find ${specDir} -name 00000002`
	echo $specDir
	len=`expr length ${specDir}`
	echo $len
	echo "***********************int data***************************" >  ${dataDir}/int.$index
	echo "" >>   ${dataDir}/int.$index 
	
	for dest in $destDir
	do
		case=${dest:$len}
		case=${case%/*}
		case=${case%/*}
		echo $case
		
		echo $dest
		cd $dest
		echo "====================================================================================="
		echo "=====================================================================================" >>   ${dataDir}/int.$index
		echo $dest >>   ${dataDir}/int.$index 
		echo $case >>   ${dataDir}/int.$index 
		if [ $i -eq 0 ];then
			perf stat -e r${umask0}${event0} -e r${umask1}${event1} -e r${umask2}${event2} -e r${umask3}${event3} -e r${umask4}${event4} -e r${umask5}${event5} -e r${umask6}${event6} -e r${umask7}${event7} -e r${umask8}${event8} -e r${umask9}${event9} -e r${umask10}${event10} -e r${umask11}${event11} -e r${umask12}${event12} -e r${umask13}${event13}  specinvoke  speccmds.cmd 2>>   ${dataDir}/int.$index
		fi

		if [ $i -eq 14 ];then
			perf stat -e r${umask14}${event14} -e r${umask15}${event15} -e r${umask16}${event16} -e r${umask17}${event17} -e r${umask18}${event18} -e r${umask19}${event19} -e r${umask20}${event20}  -e r${umask21}${event21}  -e r${umask22}${event22}  -e r${umask23}${event23}  -e r${umask24}${event24}  -e r${umask25}${event25}  -e r${umask26}${event26}  -e r${umask27}${event27} specinvoke  speccmds.cmd 2>>   ${dataDir}/int.$index
		fi
	done
	
	
	i=$(($i + 14))
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
specDir=/home/cpu/spec2000/CPU2000_install
specDir=${specDir}"/benchspec/CFP2000/"
while true
do
	index=$(($i * 3))
	echo "index"  $index
	echo "pmc_name" $pmc_name
	echo "umask"  $umask
	echo "event"  $event

	#pwd
#pwd
	destDir=`find ${specDir} -name 00000002`
	echo $specDir
	len=`expr length ${specDir}`
	echo $len
	echo "***********************fp data***************************" >  ${dataDir}/fp.$index
	echo "" >>   ${dataDir}/fp.$index 
	
	for dest in $destDir
	do
		case=${dest:$len}
		case=${case%/*}
		case=${case%/*}
		echo $case
		
		echo $dest
		cd $dest
		echo "====================================================================================="
		echo "=====================================================================================" >>   ${dataDir}/fp.$index
		echo $dest >>   ${dataDir}/fp.$index 
		echo $case >>   ${dataDir}/fp.$index 
		if [ $i -eq 0 ];then
			perf stat -e r${umask0}${event0} -e r${umask1}${event1} -e r${umask2}${event2} -e r${umask3}${event3} -e r${umask4}${event4} -e r${umask5}${event5} -e r${umask6}${event6} -e r${umask7}${event7} -e r${umask8}${event8} -e r${umask9}${event9} -e r${umask10}${event10} -e r${umask11}${event11} -e r${umask12}${event12} -e r${umask13}${event13}  specinvoke  speccmds.cmd 2>>   ${dataDir}/fp.$index
		fi

		if [ $i -eq 14 ];then
			perf stat -e r${umask14}${event14} -e r${umask15}${event15} -e r${umask16}${event16} -e r${umask17}${event17} -e r${umask18}${event18} -e r${umask19}${event19} -e r${umask20}${event20}  -e r${umask21}${event21}  -e r${umask22}${event22}  -e r${umask23}${event23}  -e r${umask24}${event24}  -e r${umask25}${event25}  -e r${umask26}${event26}  -e r${umask27}${event27} specinvoke  speccmds.cmd 2>>   ${dataDir}/fp.$index
		fi
	done
	i=$(($i + 14))
	if [ $i -eq 28 ] ;then
		echo "done !"
		sleep 2
		break	
	fi
done

