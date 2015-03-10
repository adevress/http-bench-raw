grep -R "TotalIOTime" $1 | sed 's/NA-INFN/NA_INFN/g' | sed 's/xrootd/xroot/g' | sed 's/\//-/g' |awk -F "[-:=]" '/[xroot|http]/ {print ";"$2";"$3";"$7";"}'  
