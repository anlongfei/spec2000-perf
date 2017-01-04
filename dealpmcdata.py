#!/usr/bin/python
#-* coding:utf-8 -*-
list_fp = [
    "168.wupwise"
    ,"171.swim"
    ,"172.mgrid"
    ,"173.applu"
    ,"177.mesa"
    ,"178.galgel"
    ,"179.art"
    ,"183.equake"
    ,"187.facerec"
    ,"188.ammp"
    ,"189.lucas"
    ,"191.fma3d"
    ,"200.sixtrack"
    ,"301.apsi" ]
list_int = [
    "164.gzip"
    ,"175.vpr"
    ,"176.gcc"
    ,"181.mcf"
    ,"186.crafty"
    ,"197.parser"
    ,"252.eon"
    ,"254.gap"
    ,"253.perlbmk"
    ,"255.vortex"
    ,"256.bzip2"
    ,"300.twolf"
    ]

dict_pmc =  {
"r0108" : "DTLB_LOAD_MISSES.ANY"                              ## 0
,"r0208" : "DTLB_LOAD_MISSES.WALK_COMPLETED"                  ## 1
,"r1008" : "DTLB_LOAD_MISSES.STLB_HIT"                        ## 2
,"r010E" : "UOPS_ISSUED.ANY"                                  ## 3
,"r010E" : "UOPS_ISSUED.STALLED_CYCLES"                       ## 4
,"r0113" : "LOAD_DISPATCH.RS"                                 ## 5
,"r0413" : "LOAD_DISPATCH.MOB"                                ## 6
,"rAA24" : "L2_RQSTS.MISS"                                    ## 7
,"rFF24" : "L2_RQSTS.REFERENCES"                              ## 8
,"r0C24" : "L2_RQSTS.RFOS"                                    ## 9
,"r4F2E" : "L3_LAT_CACHE.REFERENCE"                           ## 10
,"r412E" : "L3_LAT_CACHE.MISS"                                ## 11
,"r003C" : "CPU_CLK_UNHALTED.THREAD_P"                        ## 12
,"r0143" : "L1D_ALL_REF.ANY"                                  ## 13
,"r0149" : "DTLB_MISSES.ANY"                                  ## 14
,"r0180" : "L1I.HITS"                                         ## 15
,"r0280" : "L1I.MISSES"                                       ## 16
,"r0480" : "L1I.CYCLES_STALLED"                               ## 17
,"r0185" : "ITLB_MISSES.ANY"                                  ## 18
,"r0F87" : "ILD_STALL.ANY"                                    ## 19
,"r01AE" : "ITLB_FLUSH"                                       ## 20
,"r00C5" : "BR_MISP_RETIRED.ALL_BRANCHES"                     ## 21
,"r00C0" : "INST_RETIRED.ANY_P"                               ## 22
,"r00C4" : "BR_INST_RETIRED.ALL_BRANCHES"                     ## 23
,"r10CB" : "MEM_LOAD_RETIRED.L3_MISS"                         ## 24
,"r04A2" : "RESOURCE_STALLS.RS_FULL"                          ## 25
,"r0FF2" : "L2_LINES_OUT.ANY"                                 ## 26
,"r1F0B" : "UNC_L3_LINES_OUT.ANY"                             ## 27
}

list_pmc = [
"r0108" 
,"r0208"
,"r1008"
,"r010E"
,"r010E"
,"r0113"
,"r0413"
,"rAA24"
,"rFF24"
,"r0C24"
,"r4F2E"
,"r412E"
,"r003C"
,"r0143"
,"r0149"
,"r0180"
,"r0280"
,"r0480"
,"r0185"
,"r0F87"
,"r01AE"
,"r00C5"
,"r00C0"
,"r00C4"
,"r10CB"
,"r04A2"
,"r0FF2"
,"r1F0B"
        ]
global int
global fint1
global fint2
global fp
global ffp1
global ffp2
global output

def merge():
    global int
    global fint1
    global fint2
    global fp
    global ffp1
    global ffp2
    global output
    print "** merge **"
    dict_int = {}
    dict_fp = {}
    tmp = []

    for f in [fint1, fint2, ffp1, ffp2]:
        fint = open(f)
        lines = fint.readlines()
        for line in lines:
        #for line in fint.readlines():
            words = line.split()
            len_words = len(words)
            if len_words == 3 or (len_words == 1 and words[0].find("===") == -1  and words[0].find("000002") == -1):
                #if words[0].find("===") == -1  and words[0].find("000002") == -1:
                #print words
                tmp.append(words)
        fint.close()


    print "========================================"
    index = 0
    for case in list_int:
        dict_int[case] = []
    for case in list_fp:
        dict_fp[case] = []

    while index < len(tmp):
        if tmp[index][0] in list_int:
            i=1
            while i <= 14:
                dict_int[tmp[index][0]].append(tmp[index+i])
                i = i + 1

        if tmp[index][0] in list_fp:
            i=1
            while i <= 14:
                dict_fp[tmp[index][0]].append(tmp[index+i])
                i = i + 1

        index = index + 15

    outintfile=output+"/intfile.xls"
    outfpfile=output+"/fpfile.xls"
    print outintfile
    print outfpfile

    f=open(outfpfile,"wb")
    for k in list_fp:
        print k
        f.write(k+"\n")
        for case in dict_fp[k]:
            f.write(dict_pmc[case[1]]+"\t"+case[1]+"\t"+case[0]+"\n")
            print case
    f.close()
    print "************************************************"

    f=open(outintfile,"wb")
    for k in list_int:
        print k
        f.write(k+"\n")
        for case in dict_int[k]:
            f.write(dict_pmc[case[1]]+"\t"+case[1]+"\t"+case[0]+"\n")
            print case
    f.close()


def main():
    init()
    merge()

def init():
    global fint1
    global fint2
    global ffp1
    global ffp2
    global output
    print "init"
    fint1 ="./980/CPU2000/int.0"
    fint2 ="./980/CPU2000/int.42"
    ffp1  ="./980/CPU2000/fp.0"
    ffp2  ="./980/CPU2000/fp.42"
    output="./output"

    print "**** int ****"
    #for i in range(len(list_int)):
    #    print list_int[i]

    #i = 0
    #print "**** fp ****"
    #for i in range(len(list_fp)):
    #    print list_fp[i]

    #i = 0
    #print "======= pmc dict ========="
    #for i in range(len(list_pmc)):
    #    print list_pmc[i]
    #    print dict_pmc[list_pmc[i]]

if __name__ == "__main__":
    main()
