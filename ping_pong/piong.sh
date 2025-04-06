#!/bin/bash

source ./scripts/piong_main.sh
source ./scripts/piong_helper.sh

piong_instructions()
{
    echo " Game Instructions"
    echo "  q: to make player-one go up"
    echo "  a: to make player-one go down"
    echo "  p: to make player-two go up"
    echo "  l: to make player-two go down"
	echo "  y: to quit the game :("
	echo
}

start_piong
