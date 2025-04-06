
#**************************************************************************************************

#!/bin/bash
source ./scripts/compactability.sh

#**************************************************************************************************

instruction_function()
{
    echo
    echo "    INSTRUCTIONS (for the game)"
    echo "      a: to turn left"
    echo "      d: to turn right"
    echo "      s: smoothen the turns"
    echo "      q: quit the game :("
    sleep 4
}

helper_function()
{
    clear
    echo
    echo "Helper function"
    echo "run race.sh to start the game"
    echo "    ./race.sh"
    echo "    ./race.sh --external_display (or -e) if you are having an external monitor"
    echo "    ./race.sh --help (or -h) to get this helper function"
    echo
    sleep 1
    instruction_function
    echo
    exit
}

start_game $1

#**************************************************************************************************
