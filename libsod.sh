#!/bin/bash
echo "LIBSOD - LInux Bash Script Oneliners Debugger v0.1"
#bash_oneliner="curl -s https://about.me/SitemapIndex.xml | grep -v 'sitemap>' | grep -v lastmod | grep loc | sed s'/<loc>//' | sed s'*</loc>**' | tr -d ' ' "
bash_oneliner='find /etc -type f -print0 2>/dev/null | xargs -0 grep --color=AUTO -Hn 'nameserver' 2>/dev/null'
echo $bash_oneliner
suffix="/usr/bin/time --format='--- took $(tput setaf 3)%e seconds$(tput sgr 0) to complete ---' "
adder=""
prefix=" | head"
counter=0
IFS='|' # space is set as delimiter - From https://www.tutorialkart.com/bash-shell-scripting/bash-split-string/
read -ra ADDR <<< "$bash_oneliner" # bash_oneliner is read into an array as tokens separated by IFS
IFS='___'
for i in "${ADDR[@]}"; do # access each element of array
#    echo "$i" "| head "
    if (( counter <= 0 )); then adder="${adder} ${i}"; fi #skips adding | the first time
    if (( counter >= 1 )); then adder="${adder}$(echo '|')${i}"; fi #skips adding | the first time
    let counter++ 
	echo "----- now running $(tput setaf 2)$(($counter - 1)) pipe(s)$(tput sgr 0) with full command looking like this: $(tput setaf 3)$adder $(tput sgr 0)"
    eval $suffix $adder $prefix
done
echo "Bash script program is piped $(($counter - 1)) times"
echo "LIBSOD - LInux Bash Script Oneliners Debugger"
echo "https://github.com/baditaflorin/LIBSOD---LInux-Bash-Script-Oneliners-Debugger"
echo "This script is done - baditaflorin@gmail.com"
