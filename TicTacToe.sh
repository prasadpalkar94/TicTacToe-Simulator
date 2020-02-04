#!/bin/bash -x
declare -A board
echo "-------WELCOME TO TIC TAC TOE-------"
ROWS=3
COLUMNS=3
check=$((RANDOM%2))

function displayBoard(){
for ((i=1;i<=$ROWS;i++)){
for ((j=1;j<=$COLUMNS;j++)){
board[$i,$j]=""
}
}
}

function assigned(){
if [ $check -eq 1 ]
then
	player="X"
	computer="O"
else
	computer="X"
	player="O"
fi
}

displayBoard
assigned
