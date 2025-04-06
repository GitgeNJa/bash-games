#!/bin/bash

source ./scripts/tag_helper.sh
source ./scripts/tag_main.sh

tag_helper()
{
	echo " Game Note:"
	echo "  in the game, there are two types of players"
	echo "  catcher (X) would try to catch up to other players"
	echo "  runners (O or 0) will have to run away from the catcher"
	echo "  there can be two to three players at a time"
	echo "  use -m or --multi parameter with the shell command for mutiplayer"
	echo "  ie; "
	echo "    ./tag.sh -m"
	echo "    ./tag.sh --multi"
	echo "  to quit the game, press 'ctrl+c' "
}

tag_instruction()
{
	echo " Game Instructions:"
	echo
	echo " catcher controls"
	echo "   w: to go up"
	echo "   s: to go down"
	echo "   d: to go right"
	echo "   a: to go left"
	echo " runner-1 controls"
	echo "   i: to go up"
	echo "   k: to go down"
	echo "   l: to go right"
	echo "   j: to go left"
	echo " runner-2 controls"
	echo "   t: to go up"
	echo "   g: to go down"
	echo "   h: to go right"
	echo "   f: to go left"
}

start_tag $1
