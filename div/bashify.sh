#!/bin/bash
SCRIPT_NAME=$1
NUMBER_OF_LINES_BACK=$2
((NUMBER_OF_LINES_BACK++))
PARENT_COMMAND="bin/"$3

# echo shabang line and x number of lines of history to new script
echo \#\!\/$PARENT_COMMAND > $SCRIPT_NAME.sh
echo >> $SCRIPT_NAME.sh

if [ "$PARENT_COMMAND" == "bin/zsh" ]
then
	# strip to command only
	tail -n $NUMBER_OF_LINES_BACK ~/.zsh_history | 
	tac | sed "1d" | tac |
	sed 's/.\+;//;s/| /\\ \n    | /g' >> $SCRIPT_NAME.sh
else
	tail -n $NUMBER_OF_LINES_BACK ~/.bash_history |
	tac | sed "1d" | tac >> $SCRIPT_NAME.sh
fi

chmod u+x $SCRIPT_NAME.sh

# Open the newly created script with nano
nano -l +3 $SCRIPT_NAME.sh

