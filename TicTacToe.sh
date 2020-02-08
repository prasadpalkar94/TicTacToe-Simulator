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

function checkWin(){
for ((i=0;i<ROWS;i++))
do
for ((j=0;j<COLUMNS;j++))
do
	checkHorizontal=${board[$i,$j]}${board[$i,$((j+1))]}${board[$i,$((j+2))]}
	if [[ $checkHorizontal == "$player$player$player" ]]
	then
  		echo "You Won Horizontically!!"
		exit
	fi

	checkVertical=${board[$j,$i]}${board[$((j+1)),$i]}${board[$((j+2)),$i]}
	if [[ $checkVertical == "$player$player$player" ]]
	then
		echo "You Won Vertically!!"
      exit
   fi


	if [[ ${board[$i,$j]}${board[$((i+1)),$((j+1))]}${board[$((i+2)),$((j+2))]} == "$player$player$player" ]] || [[ ${board[$i,$((j+2))]}${board[$((i+1)),$((j+1))]}${board[$((i+2)),$j]} == "$player$player$player" ]]
   then
		echo "You Won Diagonally!!"
		exit
	fi
done 
done
}



assignSymbol
resetBoard
while [[ $movecount -lt $TOTALCOUNT ]]
do
	checkEmptyCell
	checkWin
done


