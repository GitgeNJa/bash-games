
# set non-blocking mode for read with a timeout of 0
exec 3<>/dev/tty
stty -icanon min 0 time 0 <&3

trap 'handle_interrupt' SIGINT
handle_interrupt()
{
    clear
    tput cup 8 16
    echo "Sad to see you go..."
    sleep 2
    clear
    exit 0
}

print_centered_text()
{
    text=$1
    text_speed=$2
    for ((i = 0; i < ${#text}; i++)); do
        echo -n "${text:$i:1}"
        if [ "${text_speed}" -eq 1 ]; then
            sleep 0.05
        elif [ "${text_speed}" -eq 2 ]; then
            sleep 0.1
        elif [ "${text_speed}" -eq 3 ]; then
            sleep 0.8
        fi
    done
}

read_input()
{
    if read -n1 -t 0; then
        read -n1 input
    fi
}

player_one_game_over()
{
    clear
    tput cup 10 12
    echo "Game Over... for player one"
    sleep 1
    tput cup 11 15
    echo "Player Two won..."
    sleep 3
    clear
    exit
}

player_two_game_over()
{
    clear
    tput cup 10 12
    echo "Game Over... for player two"
    sleep 1
    tput cup 11 15
    echo "Player One won..."
    sleep 3
    clear
    exit
}

level_up()
{
    ((speed_counter++))
    if [ $speed_counter -eq 5 ]; then
        level=3
        speed=1
    elif [ $speed_counter -eq 1 ]; then
        level=2
        speed=2
    fi
}

flip()
{
    if [ $y_movement -eq 1 ];then
        y_movement=2
    else
        y_movement=1
    fi
}

player_bounce_condition()
{
    if [ $ball_y_position -eq $player_one_y_position ]; then
        if [ $ball_x_position -eq $player_one_x_position ]; then
            flip
        else
            player_one_game_over
        fi
    fi
    if [ $ball_y_position -eq $player_two_y_position ]; then
        if [ $ball_x_position -eq $player_two_x_position ]; then
            flip
            level_up
        else
            player_two_game_over
        fi
    fi
}

wall_bounce_condition()
{
    if [ $ball_x_position -eq 2 ]; then
        x_movement=2
    elif [ $ball_x_position -eq 19 ]; then
        x_movement=1
    fi
}
