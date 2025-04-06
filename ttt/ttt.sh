#!/bin/bash

source ./scripts/ttt_helper.sh
source ./scripts/ttt_main.sh
source ./scripts/ttt_utility.sh

ttt_instruction()
{
    echo "  +=====================================================+"
    echo "  |                 Game Instruction                    |"
    echo "  +=====================================================+"
    echo "  | the old tick tac toe multiplayer (two player) game  |"
    echo "  |  you can choose either X or O (O starts the game)   |"
    echo "  |      select from the 9 positions to put an O        |"
    echo "  |      or an X in your assigned turn to mark it       |"
    echo "  |   if you are able to get your three symbols in a    |"
    echo "  | line, that person would win the game. when you exit |"
    echo "  | the total points each players have won is displayed |"
    echo "  +=====================================================+"
}

start_ttt
