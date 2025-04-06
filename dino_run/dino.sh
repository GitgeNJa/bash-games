#!/bin/bash

source ./scripts/dino_main.sh
source ./scripts/dino_helper.sh

dino_instructions()
{
	echo " Game Instructions"
	echo "  the game was inspired from the Chrome Dino,"
	echo "  while there is not internet connection"
	echo "  the running dino can only be stopped by cactus"
	echo "  but you are the dino and you should jump over it"
	echo "  or atleast on top of it"
	echo "  the sides are poisonous"
	echo "  use 'w' to jump and 'q' to quit the game" 
	echo
}

start_dino_run
