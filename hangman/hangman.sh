
#!/bin/bash

source ./hangman_animation.sh
source ./hangman_helper.sh

start_animation

echo " Instruction"
echo "  the game is to guess a word within seven attempts"
echo "  you can guess a letter in each turns"
echo "  the difficulty rate increses with each level"
echo "  there is a total of four levels"
echo
echo " press 'ENTER' to continue"

play_hangman
