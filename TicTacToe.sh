#!/bin/bash -x 
declare -A board
echo "-------WELCOME TO TIC TAC TOE-------"
ROWS=3
COLUMNS=3
PLAYER=1
COMPUTER=0
check=$((RANDOM%2))

function resetBoard(){
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

function displayBoard(){
echo "|$board[0][0]|$board[0][1]|$board[0][2]|"
echo "|$board[1][0]|$board[1][1]|$board[1][2]|"
echo "|$board[2][0]|$board[2][1]|$board[2][2]|"
}


displayBoard
resetBoard
assigned
toss
