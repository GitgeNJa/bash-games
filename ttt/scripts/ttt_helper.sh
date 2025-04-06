
total_x_wins=0
total_y_wins=0

choose_option()
{
    tput cup 15 0
    echo "Enter your choice:                            "
    echo "                                              "
    echo "                                              "
    tput cup 16 0
}

check_x_win_conditions()
{
    if [[ " ${positions_taken_x[@]} " =~ " $value " ]]; then
        ((x_win++))
    else
        x_win=0
    fi
    if [ $x_win -eq 3 ]; then
        tput cup 18 0
        echo "    Player X won the game"
        ((total_x_wins++))
        echo
        echo "  press 'ENTER' to continue"
        read -p ""
        select_option
    fi
}

check_o_win_conditions()
{
    if [[ " ${positions_taken_o[@]} " =~ " $value " ]]; then
        ((y_win++))
    else
        y_win=0
    fi
    if [ $y_win -eq 3 ]; then
        tput cup 18 0
        echo "    Player O won the game"
        ((total_y_wins++))
        echo
        echo "  press 'ENTER' to continue"
        read -p ""
        select_option
    fi
}

check_win()
{
    x_win=0
    y_win=0
    for value in {1,2,3}; do
        check_x_win_conditions
        check_o_win_conditions
    done
    x_win=0
    y_win=0
    for value in {4,5,6}; do
        check_x_win_conditions
        check_o_win_conditions
    done
    x_win=0
    y_win=0
    for value in {7,8,9}; do
        check_x_win_conditions
        check_o_win_conditions
    done
    x_win=0
    y_win=0
    for value in {1,4,7}; do
        check_x_win_conditions
        check_o_win_conditions
    done
    x_win=0
    y_win=0
    for value in {2,5,8}; do
        check_x_win_conditions
        check_o_win_conditions
    done
    x_win=0
    y_win=0
    for value in {3,6,9}; do
        check_x_win_conditions
        check_o_win_conditions
    done
    x_win=0
    y_win=0
    for value in {1,5,9}; do
        check_x_win_conditions
        check_o_win_conditions
    done
    x_win=0
    y_win=0
    for value in {3,5,7}; do
        check_x_win_conditions
        check_o_win_conditions
    done
}

check_draw()
{
    draw=0
    for num in {1..9}; do
        if [[ ! " ${positions_taken[@]} " =~ " $num " ]]; then
            continue
        else
            ((draw++))
        fi
    done
    if [ $draw -eq 9 ]; then
        tput cup 18 0
        echo "           Draw"
        echo
        echo "  press 'ENTER' to continue"
        read -p ""
        select_option
    fi
}

toggle_symbol()
{
    if [ "$symbol" -eq 1 ]; then
        symbol=0
    else
        symbol=1
    fi
}
