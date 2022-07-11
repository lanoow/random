#!/bin/bash

## Variables ##
JAR=paper.jar # MCV: your_minecraft_server_version
MAXRAM=4096M  # 4GB
MINRAM=256M   # 256MB
TIME=5        # In seconds

## Code ##
while [ true ]; do
    java -Xmx$MAXRAM -Xms$MINRAM -jar $JAR nogui

    if [[ ! -d "exit_codes" ]]; then
        mkdir "exit_codes";
    fi

    if [[ ! -f "exit_codes/server_exit_codes.log" ]]; then
        touch "exit_codes/server_exit_codes.log";
    fi

    echo "[$(date +"%d.%m.%Y %T")] ExitCode: $?" >> exit_codes/server_exit_codes.log
    echo "----- Press [ENTER] to prevent the server from restarting in $TIME seconds -----";
    read -t $TIME input;
	
    if [ $? == 0 ]; then
        break;
    else
        echo "------------ THE SERVER IS RESTARTING ------------";
    fi
done
