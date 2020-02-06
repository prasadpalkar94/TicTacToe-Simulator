#!/bin/bash
declare -A board
echo "-------WELCOME TO TIC TAC TOE-------"
TOTALMOVE=9
ROWS=3
COLUMNS=3
PLAYER=1
COMPUTER=0
check=$((RANDOM%2))
movecount=0

function resetBoard(){
	for ((i=0;i<$ROWS;i++))
	do
		for ((j=0;j<$COLUMNS;j++))
		do
			board[$i,$j]="-"
		done
	done
}

function assigned(){
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
	echo PLAYER has won Toss
else
	echo COMPUTER has won Toss
fi
}

function displayBoard(){
	for (( i=0; i<$ROWS; i++ ))
	do
			echo "-------------"
		for (( j=0; j<$COLUMNS; j++ ))
		do
			echo -n  "| ${board[$i,$j]} "
		done
			echo "|"
	done
				echo "-------------"
}

function checkEmptyCell(){
	read -p "Enter row and column position" row column
	if [[ ${board[$row,$column]} == "-" ]]
	then
		board[$row,$column]=$player
		((movecount++))
		displayBoard
	else
		echo "Position Occupied OR Invalid Position"
	fi
#checkEmptyCell
}
resetBoard
assigned
while [ $movecount -lt $TOTALMOVE ]
do
checkEmptyCell
done

