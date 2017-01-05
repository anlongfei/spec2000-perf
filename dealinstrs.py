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
global fint
global ffp
global output

def dealdata():
    global fint
    global ffp
    global output
    print "** dealdata**"
    int = []
    fp = []

    f = open(fint)
    lines = f.readlines()
    for line in lines:
        words = line.split()
        len_words = len(words)
        if len_words == 2 or len_words == 1:
            int.append(words)
    f.close()

    f = open(ffp)
    lines = f.readlines()
    for line in lines:
        words = line.split()
        len_words = len(words)
        if len_words == 2 or len_words == 1:
            fp.append(words)
    f.close()

    outfile = output+"/spec2000-int.txt"
    print outfile
    f=open(outfile,"wb")
    print "===========int======================"
    for case in int:
        print case
        lencase = len(case)
        if lencase == 1:
            f.write(case[0]+"\n")
        if lencase == 2:
            f.write(case[1]+"\t"+case[0]+"\n")
    f.close()

    outfile=output+"/spec2000-fp.txt"
    f=open(outfile,"wb")
    print "===========fp======================"
    for case in fp:
        lencase = len(case)
        if lencase == 1:
            f.write(case[0]+"\n")
        if lencase == 2:
            f.write(case[1]+"\t"+case[0]+"\n")
    f.close()


def main():
    init()
    dealdata()

def init():
    global fint
    global ffp
    global output
    print "init"
    fint ="./instrs/int.instr"
    ffp ="./instrs/fp.instr"
    output="./instrs"

if __name__ == "__main__":
    main()
