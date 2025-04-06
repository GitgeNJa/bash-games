
declare -A board

# initialize the snake
snake=(10, 3 10, 4 10, 5)

initialize_board()
{
    for ((i = 0; i < total_rows; i++)); do
        for ((j = 0; j < total_columns; j++)); do
            board[$i, $j]=$empty_char
        done
    done
}

print_board()
{
    clear
    echo "*******************************************************************************"
    tput cup 1 30
    echo "SNAKE_BITE"
    tput cup 1 60
    echo "level: $level, point: $point"
    echo "*******************************************************************************"
    for ((i = 0; i < total_rows; i++)); do
        for ((j = 0; j < total_columns; j++)); do
            echo -n "${board[$i, $j]} "
        done
        echo
    done
    echo "*******************************************************************************"
}

create_easter_egg()
{
    for ((i = 0; i < total_rows; i++)); do
        for ((j = 0; j < total_columns; j++)); do
            board[$i, $j]="*"
        done
    done
    print_board
}

generate_food()
{
    food_row=$((RANDOM % total_rows))
    food_col=$((RANDOM % total_columns))
    board[$food_row, $food_col]=$food_char
}

check_hit()
{
    #IFS seperates row and column from the array
    IFS=',' read -r row col <<<"$snake_head"
    if ((row < 0 || row >= total_rows || col < 0 || col >= total_columns)); then
        clear
        tput cup 10 30
        echo "Oops! You hit the wall"
        sleep 1
        game_over
    elif [[ "${board[$row, $col]}" == "$snake_char" && EE -eq 0 ]]; then
        clear
        tput cup 10 30
        echo "Oops! You bit yourself"
        sleep 1
        game_over
    fi
}

update_snake()
{
    if [[ "${board[$row, $col]}" == "$food_char" ]]; then
        #update the array by replacing the first element with a new value ($snake_head)
        snake=("$snake_head" "${snake[@]}")
        generate_food
        ((point++))
    else
        #update the array by replacing the first element with a new value ($snake_head)
        #and shifting the rest of the elements
        snake=("$snake_head" "${snake[@]:0:${#snake[@]}-1}")
    fi

    initialize_board
    for part in "${snake[@]}"; do
        IFS=',' read -r row col <<<"$part"
        board[$row, $col]=$snake_char
    done
    board[$food_row, $food_col]=$food_char
}

update_board()
{
    check_hit
    update_snake
    level_speed
}
