#!/bin/bash 
declare -A board
echo "-------WELCOME TO TIC TAC TOE-------"
ROWS=3
COLUMNS=3
PLAYER=1
TOTALCOUNT=9
check=$((RANDOM%2))
movecount=1
function resetBoard(){
	for ((i=0;i<$ROWS;i++))
	do
		for ((j=0;j<$COLUMNS;j++))
		do
			board[$i,$j]="-"
		done
	done
}

function assignSymbol(){
	if [ $check -eq $PLAYER ]
	then
		player="X"
	else
		player="O"
	fi
	echo player $player assigned
}

function toss(){
	if [ $check -eq $PLAYER ]
	then
		echo PLAYER $player has won Toss
	else
		echo PLAYER $player has won Toss
	fi
}

function displayBoard(){
	echo "----------"
	for (( i=0; i<$ROWS; i++ ))
	do
		for (( j=0; j<$COLUMNS; j++ ))
		do
			echo -n "| ${board[$i,$j]} "
		done
			echo "|"
			echo "----------"
	done
}

function checkEmptyCell(){
	read -p "Enter row" row
	read -p "Enter column" column
	if [[ ${board[$row,$column]} == "-" ]]
	then
		board[$row,$column]=$player
		((movecount++))
		displayBoard
	else
		echo "Position Occupied Or Invalid Position"
	fi
}

assignSymbol
resetBoard
while [[ $movecount -lt $TOTALCOUNT ]]
do
	checkEmptyCell
done


