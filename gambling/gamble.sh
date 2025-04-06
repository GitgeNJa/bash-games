#!/bin/bash

source ./scripts/gamble_helper.sh
source ./scripts/gamble_main.sh
source ./scripts/gamble_utility.sh

gamble_instruction()
{
    echo "  +==============================================+"
    echo "  |             Game Instruction                 |"
    echo "  +==============================================+"
    echo "  |  there are three slots in the slot machine   |"
    echo "  |  each individual spin will cost you 1 rupee  |"
    echo "  |  spin generates random numbers in the slots  |"
    echo "  |  your point is the sum of the three slots    |"
    echo "  |  if you get the same number in all 3 slots   |"
    echo "  |  then you hit jackpot, gets you 1000 points  |"
    echo "  |  you can redeem 1 rupee for each 100 points  |"
    echo "  |  starting bonous of Rs.20 is given for free  |"
    echo "  |  if u are really intrested in betting more   |"
    echo "  |  please do contact the game developer geNJa  |"
    echo "  +==============================================+"
}

start_gamble
