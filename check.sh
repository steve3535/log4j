#!/bin/bash
if [ $# -eq 0 ];then
	echo "No argument specified ..assuming the entire filesystem .."
        SEARCH_DIRECTORY=/
else 
        SEARCH_DIRECTORY="$1"
fi


echo
echo "Scan for log4j calls in jar files ... this might take sometime ..."
echo
for i in `grep -r --include \*.jar log4j ${SEARCH_DIRECTORY} -l 2>/dev/null` ;do

  #echo -e "File ==>" "$i" '\e[33m'
  jar tf $i | grep 'log4j.*jar' 
  if [ $? -eq 0 ];then
	  echo -e "==> \e[32mOccurence found\e[m in \e[33m$i\e[m"
  fi

done

 
