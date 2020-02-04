#!/bin/bash -x
declare -A board
echo "-------WELCOME TO TIC TAC TOE-------"
ROWS=3
COLUMNS=3
PLAYER=1
COMPUTER=0
check=$((RANDOM%2))

function displayBoard(){
for ((i=1;i<=$ROWS;i++)){
for ((j=1;j<=$COLUMNS;j++)){
board[$i,$j]=""
}
}
}

function assigned(){
if [ $check -eq $PLAYER ]
then
	player="X"
	computer="O"
else
	computer="X"
	player="O"
fi
}

function toss(){
if [ $check -eq $PLAYER ]
then
echo PLAYER has won Toss
else
echo COMPUTER has won Toss
fi
}


displayBoard
assigned
toss
