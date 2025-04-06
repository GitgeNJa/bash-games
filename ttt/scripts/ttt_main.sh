
declare -a positions_taken
declare -a positions_taken_x
declare -a positions_taken_o

symbol=0

check_condition()
{
    toggle_symbol
    check_win
    check_draw
}

set_position()
{
    if [[ $new_position =~ ^[0-9]+$ ]] && \
       [ "$new_position" -gt 0 ] && [ "$new_position" -lt 10 ]; then
        if [[ "${positions_taken[@]}" =~ $new_position ]]; then
            tput cup 16 0
            echo "You have already taken that position"
            echo "Try again..."
            sleep 1
        else
            positions_taken+=("$new_position")
            if [ "$symbol" -eq 1 ]; then
                positions_taken_x+=("$new_position")
            else
                positions_taken_o+=("$new_position")
            fi
            display_symbol
            check_condition
        fi
    elif [ "$new_position" = "q" ]; then
        clear
        tput cup 2 10
        echo "Exiting..."
        tput cup 3 8
        echo "X won $total_x_wins times"
        tput cup 4 8
        echo "Y won $total_y_wins times"
        echo
        echo "  press 'ENTER' to continue"
        read -p ""
        clear
        exit
    else
        echo "Invalid choice"
        sleep 1
    fi
}

select_option()
{
    clear
    ttt_heading
    sleep 1
    unset positions_taken
    unset positions_taken_x
    unset positions_taken_o
    generate_box
    while true; do
        choose_option
        read -p "" new_position
        set_position
    done
}

start_ttt()
{
    clear
    ttt_instruction
	echo
    sleep 0.5
    echo "  press 'ENTER' to continue"
    read -p ""
    select_option
}
