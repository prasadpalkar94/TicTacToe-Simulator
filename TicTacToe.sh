##!/bin/bash -x 
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
	board[$i,$j]=" "
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



function checkWinORTiePlayer()
{
read -p "Enter the row for position" row
read -p "Enter the column for position" column
}

displayBoard
#resetBoard
#assigned
#toss
