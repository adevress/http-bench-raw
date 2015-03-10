#!/bin/bash



file_list=( "https://f-dpm000.grid.sinica.edu.tw/dpm/grid.sinica.edu.tw/home/dteam/group.test.hc.NTUP_SMWZ.root" "root://f-dpm000.grid.sinica.edu.tw//dteam/group.test.hc.NTUP_SMWZ.root"  
	    "https://agh3.atlas.unimelb.edu.au/dpm/atlas.unimelb.edu.au/home/dteam/group.test.hc.NTUP_SMWZ.root" "root://agh3.atlas.unimelb.edu.au//dteam/group.test.hc.NTUP_SMWZ.root"
	    "https://lcg-door4.scinet.utoronto.ca:2880/pnfs/scinet.utoronto.ca/data/dteam/group.test.hc.NTUP_SMWZ.root" "root://lcg-door3.scinet.utoronto.ca:1094//pnfs/scinet.utoronto.ca/data/dteam/group.test.hc.NTUP_SMWZ.root"
)
prefix_list=("http" "xroot" "https" "xroot" "http" "xroot")
site_list=("TAIWAN" "TAIWAN" "AUSTRALIA" "AUSTRALIA" "DCACHE_CANADA" "DCACHE_CANADA") 


if [[ "$1" == "" ]]; then
	echo "Usage $0 [dir]"
	exit -1
fi


mkdir -p $1

while [ true ]
do


for ((i=0; i< ${#file_list[@]}; i++))
do
	echo "execute testHammerCloud  on ${file_list[${i}]}"
	./testHammercloud ${file_list[${i}]} &> $1/${prefix_list[${i}]}-${site_list[${i}]}-$RANDOM-`date +%s`

	echo "end execution"
done


done

