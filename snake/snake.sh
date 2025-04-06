
#!/bin/bash
source ./scripts/snake_main.sh

game_instruction()
{
    echo
    echo "    INSTRUCTIONS (for the game)"
    echo "      w: to turn up"
    echo "      s: to turn down"
    echo "      a: to turn left"
    echo "      d: to turn right"
    echo "      q: quit the game :("
    sleep 4
}

start_game
