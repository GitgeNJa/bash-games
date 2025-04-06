
source ./scripts/snake_animation.sh
source ./scripts/snake_board_update.sh
source ./scripts/snake_helper.sh

total_rows=23
total_columns=40
snake_char="O"
food_char="X"
empty_char="."
input="d"
point=0
EE=0

game_loop()
{
    while true; do
        print_board
        read_input

        case $input in
        "w"|"W")
            snake_head=${snake[0]}
            IFS=',' read -r row col <<<"$snake_head"
            snake_head="$((row - 1)),$col"
            ;;
        "s"|"S")
            snake_head=${snake[0]}
            IFS=',' read -r row col <<<"$snake_head"
            snake_head="$((row + 1)),$col"
            ;;
        "a"|"A")
            snake_head=${snake[0]}
            IFS=',' read -r row col <<<"$snake_head"
            snake_head="$row,$((col - 1))"
            ;;
        "d"|"D")
            snake_head=${snake[0]}
            IFS=',' read -r row col <<<"$snake_head"
            snake_head="$row,$((col + 1))"
            ;;
        "e")
            if [ $EE -eq 1 ]; then
                EE=0
            else
                EE=1
            fi
            clear
            create_easter_egg
            sleep 0.05
            input=$previous_input
            ;;
        "q"|"Q")
            break
            ;;
        esac
        previous_input=$input

        update_board
    done
}

start_game()
{
    snake_animation
    game_instruction
    count_down
    initialize_board
    generate_food
    game_loop
    game_over
}
