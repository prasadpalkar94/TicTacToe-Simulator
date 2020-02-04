#!/bin/bash -x
declare -A board
echo "-------WELCOME TO TIC TAC TOE-------"
ROWS=3
COLUMNS=3

function displayBoard(){
for ((i=1;i<=$ROWS;i++)){
for ((j=1;j<=$COLUMNS;j++)){
board[$i,$j]=""
}
}
}
displayBoard
