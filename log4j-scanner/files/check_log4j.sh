#!/bin/bash
FACT_FILE=/etc/ansible/facts.d/log4j_search.fact
if [ $# -eq 0 ];then

        SEARCH_DIRECTORY=/
else
        SEARCH_DIRECTORY="$1"
fi
for i in `grep -r --include \*.jar log4j ${SEARCH_DIRECTORY} -l 2>/dev/null` ;do
  unzip -l $i | grep 'log4j.*jar' >> "$FACT_FILE"
  if [ $? -eq 0 ];then
    echo -e "  \e[33m ==> Occurence found in $i \e[m" >> "$FACT_FILE"
  fi
done
