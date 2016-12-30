#/bin/bash

spec=/home/cpu/spec2000/CPU2000_install
specbenchspec=${spec}/benchspec/
lenbenchspec=`expr length $specbenchspec`
cur=`pwd`
specFP=${spec}/benchspec/CFP2000/
lenFP=`expr length $specFP`
specINT=${spec}/benchspec/CINT2000/
lenINT=`expr length $specINT`
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

funCpCmds(){
	fplist=`find ${specFP} -name 00000002`
	intlist=`find ${specINT} -name 00000002`
	echo $lenFP  $lenINT
	cd $cur
	if [ -d "casecmds" ];then
		echo " ---> rm casecmds"
		rm -rf casecmds
	fi
	echo " ---> mkdir casecmds"
	mkdir casecmds
	cd $cur/casecmds

	echo -e "\t\tint cmds\n" > int.cmds
	for case in $intlist 
	do
		curcase=${case:$lenbenchspec}
		echo curcase $curcase
		mkdir -p $curcase
		cp $case/speccmds.cmd $curcase
		tmp=${curcase#*/}
		tmp=${tmp%/*}
		tmp=${tmp%/*}
		echo -e "\n"$tmp >> int.cmds
		sed -n '2,$p' $case/speccmds.cmd >> int.cmds
	done

	echo -e "\t\tfp cmds\n" > fp.cmds
	for case in $fplist 
	do
		curcase=${case:$lenbenchspec}
		echo curcase $curcase
		mkdir -p $curcase
		cp $case/speccmds.cmd $curcase
		tmp=${curcase#*/}
		tmp=${tmp%/*}
		tmp=${tmp%/*}
		echo -e "\n"$tmp >> fp.cmds
		sed -n '2,$p' $case/speccmds.cmd >> fp.cmds
	done


}

funCpCmds
