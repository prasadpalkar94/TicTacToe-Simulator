#! /bin/bash  
declare -A board
echo "-------WELCOME TO TIC TAC TOE-------"
ROWS=3
COLUMNS=3
PLAYER=1
TOTALCOUNT=8
check=$((RANDOM%2))
movecount=0
block=0

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
		computer="O"
	else
		player="O"
		computer="X"
	fi
		echo Player $player Assigned.
		echo Computer $computer Assigned.
}

function toss(){
	if [ $check -eq $PLAYER ]
	then
		echo Player $player has won Toss
	else
		echo Computer $computer has won Toss
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
		echo "1.Position Occupied Or Invalid Position"
	fi
}

function checkWin(){
for ((i=0;i<ROWS;i++))
do
	for ((j=0;j<COLUMNS;j++))
	do
		checkHorizontal=${board[$i,$j]}${board[$i,$(($j+1))]}${board[$i,$(($j+2))]}
			if [[ $checkHorizontal == "$player$player$player" ]]
			then
  				echo "You Won Horizontically!!"
				exit
			elif [[ $checkHorizontal == "$computer$computer$computer" ]]
			then
				echo "Computer Won Horizontically!!"
				exit
			fi

		checkVertical=${board[$j,$i]}${board[$(($j+1)),$i]}${board[$(($j+2)),$i]}
			if [[ $checkVertical == "$player$player$player" ]]
			then
				echo "You Won Vertically!!"
				exit
			elif [[ $checkVertical == "$computer$computer$computer" ]]
			then
				echo "Computer Won Vertically!!"
      		exit
   		fi

		firstDiagonal=${board[$i,$j]}${board[$(($i+1)),$(($j+1))]}${board[$(($i+2)),$(($j+2))]} 
		secondDiagonal=${board[$i,$(($j+2))]}${board[$(($i+1)),$(($j+1))]}${board[$(($i+2)),$j]}
			if [[ $firstDiagonal == "$player$player$player" ]] || [[ $secondDiagonal == "$player$player$player" ]]
   		then
				echo "You Won Diagonally!!"
				exit
			elif [[ $firstDiagonal == "$computer$computer$computer" ]] || [[ $secondDiagonal == "$computer$computer$computer" ]]
			then
				echo "Computer Won Diagonally!!"
				exit
			fi
	done 
done
}

function tieGame(){
if [[ $movecount -eq $TOTALCOUNT ]]
then  
      echo "Match Tie!!"
      exit
fi
}

function userTurn(){
	read -p "Enter row" row
	read -p "Enter column" column
		if [[ ${board[$row,$column]} == "-" ]]
		then
			board[$row,$column]=$player
			((movecount++))
			echo $movecount
			displayBoard
			checkWin
			flag=0
			computerTurn
		else
			echo "Position Occupied Or Invalid Position For User!!"
			tieGame
			userTurn
		fi
}

function computerTurn(){
flag=0
checkWin
#computerWinCheck
if [[ $block -ne 1  ]]
then
computerBlockCheck
displayBoard
fi
if [[ $block == 2 ]]
then
flag=1
userTurn
fi
if [[ $flag == 0 ]]
then
	row=$((RANDOM%3))
	column=$((RANDOM%3))
		if [[ ${board[$row,$column]} == "-" ]]
		then
			board[$row,$column]=$computer
			((movecount++))
			displayBoard
			userTurn
		else
			echo "Position Occupied Or Invalid Position For Computer!!"	
			tieGame
			computerTurn
		fi
fi

}

function win(){
displayBoard
echo "Computer Won!!"
exit
}

function computerWinCheck(){
for ((i=0;i<ROWS;i++))
do
	for ((j=0;j<COLUMNS;j++))
	do
#-----horizontal---
		if [[ ${board[$i,$j]} == "-" && ${board[$i,$(($j+1))]} == $computer && ${board[$i,$(($j+2))]} == $computer ]]
		then 
 			board[$i,$j]=$computer
			block=1
			break
		elif [[ ${board[$i,$j]} == $computer && ${board[$i,$(($j+1))]} == "-" && ${board[$i,$(($j+2))]} == $computer ]]
		then 
 			board[$i,$(($j+1))]=$computer
			block=1
			break
		elif [[ ${board[$i,$j]} == $computer && ${board[$i,$(($j+1))]} == $computer && ${board[$i,$(($j+2))]} == "-" ]]
		then 
 			board[$i,$(($j+2))]=$computer
			block=1
			break
		fi
#------Vertical-----
		if [[ ${board[$j,$i]} == "-" && ${board[$(($j+1)),$i]} == $computer && ${board[$(($j+2)),$i]} == $computer ]]
		then
			board[$j,$i]=$computer
			block=1
			break
		elif [[ ${board[$j,$i]} == $computer && ${board[$(($j+1)),$i]} == "-" && ${board[$(($j+2)),$i]} == $computer ]]
		then 
			board[$(($j+1)),$i]=$computer
			block=1
			break
		elif [[ ${board[$j,$i]} == $computer && ${board[$(($j+1)),$i]} == $computer && ${board[$(($j+2)),$i]} == "-" ]]
		then 
			board[$(($j+2)),$i]=$computer
			block=1
			break
		fi
#-----1st--diagonal----
		if [[ ${board[$i,$j]} == "-" && ${board[$(($i+1)),$(($j+1))]} == $computer && ${board[$(($i+2)),$(($j+2))]} == $computer ]]
		then 
			board[$i,$j]=$computer
			block=1
			break
		elif [[ ${board[$i,$j]} == $computer && ${board[$(($i+1)),$(($j+1))]} == "-" && ${board[$(($i+2)),$(($j+2))]} == $computer ]]
		then 
			board[$(($i+1)),$(($j+1))]=$computer
			block=1
			break
		elif [[ ${board[$i,$j]} == $computer && ${board[$(($i+1)),$(($j+1))]} == $computer && ${board[$(($i+2)),$(($j+2))]} == "-" ]]
		then 
			board[$(($i+2)),$(($j+2))]=$computer
			block=1
			break
		fi
#--------2nd diagonal---
		if [[ ${board[$i,$(($j+2))]} == "-" && ${board[$(($i+1)),$(($j+1))]} == $computer && ${board[$(($i+2)),$j]} == $computer ]]
		then 
			board[$i,$(($j+2))]=$computer
			block=1
			break
		elif [[ ${board[$i,$(($j+2))]} == $computer && ${board[$(($i+1)),$(($j+1))]} == "-" && ${board[$(($i+2)),$j]} == $computer ]]
		then 
			board[$(($i+1)),$(($j+1))]=$computer
			block=1
			break
		elif [[ ${board[$i,$(($j+2))]} == $computer && ${board[$(($i+1)),$(($j+1))]} == $computer && ${board[$(($i+2)),$j]} == "-" ]]
		then 
			board[$(($i+2)),$j]=$computer
			block=1
			break
		fi
	done
if [ $block -eq 1 ]
then 
break
fi
done
checkWin
if [ $block -eq 1 ]
then
win
fi
}

function computerBlockCheck(){
for ((i=0;i<ROWS;i++))
do
	for ((j=0;j<COLUMNS;j++))
	do
#-----horizontal---
		if [[ ${board[$i,$j]} == "-" && ${board[$i,$(($j+1))]} == $player && ${board[$i,$(($j+2))]} == $player ]]
		then 
			board[$i,$j]=$computer
			block=2
			break
		elif [[ ${board[$i,$j]} == $player && ${board[$i,$(($j+1))]} == "-" && ${board[$i,$(($j+2))]} == $player ]]
		then 
			board[$i,$(($j+1))]=$computer
			block=2
			break
		elif [[ ${board[$i,$j]} == $player && ${board[$i,$(($j+1))]} == $player && ${board[$i,$(($j+2))]} == "-" ]]
		then 
			board[$i,$(($j+2))]=$computer
			block=2
			break
		fi
#------Vertical-----
		if [[ ${board[$j,$i]} == "-" && ${board[$(($j+1)),$i]} == $player && ${board[$(($j+2)),$i]} == $player ]]
		then
			board[$j,$i]=$computer
			block=2
			break
		elif [[ ${board[$j,$i]} == $player && ${board[$(($j+1)),$i]} == "-" && ${board[$(($j+2)),$i]} == $player ]]
		then 
			board[$(($j+1)),$i]=$computer
			block=2
			break
		elif [[ ${board[$j,$i]} == $player && ${board[$(($j+1)),$i]} == $player && ${board[$(($j+2)),$i]} == "-" ]]
		then 
			board[$(($j+2)),$i]=$computer
			block=2
			break
		fi
#-----1st--diagonal----
		if [[ ${board[$i,$j]} == "-" && ${board[$(($i+1)),$(($j+1))]} == $player && ${board[$(($i+2)),$(($j+2))]} == $player ]]
		then 
			board[$i,$j]=$computer
			block=2
			break
		elif [[ ${board[$i,$j]} == $player && ${board[$(($i+1)),$(($j+1))]} == "-" && ${board[$(($i+2)),$(($j+2))]} == $player ]]
		then 
			board[$(($i+1)),$(($j+1))]=$computer
			block=2
			break
		elif [[ ${board[$i,$j]} == $player && ${board[$(($i+1)),$(($j+1))]} == $player && ${board[$(($i+2)),$(($j+2))]} == "-" ]]
		then 
			board[$(($i+2)),$(($j+2))]=$computer
			block=2
			break
		fi
#--------2nd diagonal---
		if [[ ${board[$i,$(($j+2))]} == "-" && ${board[$(($i+1)),$(($j+1))]} == $player && ${board[$(($i+2)),$j]} == $player ]]
		then 
			board[$i,$(($j+2))]=$computer
			block=2
			break
		elif [[ ${board[$i,$(($j+2))]} == $player && ${board[$(($i+1)),$(($j+1))]} == "-" && ${board[$(($i+2)),$j]} == $player ]]
		then 
			board[$(($i+1)),$(($j+1))]=$computer
			block=2
			break
		elif [[ ${board[$i,$(($j+2))]} == $player && ${board[$(($i+1)),$(($j+1))]} == $player && ${board[$(($i+2)),$j]} == "-" ]]
		then 
			board[$(($i+2)),$j]=$computer
			block=2
			break
		fi
	done
if [ $block -eq 2 ]
then 
break
fi
done
checkWin
}




assignSymbol
resetBoard
while [[ $movecount -ne $TOTALCOUNT ]]
do
	computerTurn
done


