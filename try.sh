#!/bin/bash
count=1
timedef=7
ydef=6
while getopts ":i:n:" opt; do
  case ${opt} in
    i)
        time1=${OPTARG}
    ;;
    n)
        y=$OPTARG
        
    ;;
    \?)
    echo "Usage: cmd [-i] [-n]"
    ;;
  esac
done

shift $((OPTIND-1))

command=$@

if [ -z $time1 ] && [ ! -v $TRY_INTERVAL ]; then
    time1=$TRY_INTERVAL
    #echo "$time1 if"
elif [ -e $time1 ]; then
    time1=$timedef
    #echo "$time1 elif"
fi

if [ -z $y ] && [ ! -v $TRY_NUMBER ]; then
    y=$TRY_NUMBER
elif [ -e $y ]; then
    y=$ydef
    #echo "$y else"
fi

if [ -z "$command" ] && [ ! -v $TRY_COMMAND ]; then
    command=$TRY_COMMAND
fi

if [ -z "$command" ]; then
    echo "no command to run"
    exit 1;
fi
echo "command:$command"

while true; do
eval $command
    if [[ $? -eq 0 ]]; then
        echo "Command ran successfully"
        break
    fi
    if [[ $count -ge $y ]]; then
        echo "Command Failed after retrying $y times"
        break
    else
        echo "Command Failed retrying in $time1"
        sleep $time1
        let "count+=1"
    fi
done