
#**************************************************************************************************

### Race on SHELL (main.sh) ###
# this is the main script that run all other scripts #

# set non-blocking mode for read with a timeout of 0
exec 3<>/dev/tty
stty -icanon min 0 time 0 <&3

#**************************************************************************************************

# initial setup
player_position=2
opponent_position=1
layer_count=1
smoothness=0
point=0
level=1
crash=0
EE=0

#**************************************************************************************************

count_down()
{
    for ((i = 3; i != 0; i--)); do
        clear
        tput cup 25 108
        echo $i
        sleep 1
    done
    clear
    tput cup 25 106
    echo "Start"
    sleep 1
    clear
}

game_over()
{
    clear
    tput cup 25 90
    print_centered_text "Game over" 2
    print_centered_text " ..." 3
    tput cup 26 90
    print_centered_text "[points recived: $((point - 1))]" 2
    sleep 2
    clear
    exit
    # echo "Do you want to play again? (y/Y)"
    # read -rsn1 input
    # if [ "$input" != "y" ] && [ "$input" != "Y" ]; then
    #     exit
    #     clear
    # fi
}

#**************************************************************************************************

draw_box()
{
    echo " _______________________________________________________________"
    echo "|                         Race on SHELL                         |"
    if [ $point -gt -1 ] && [ $point -lt 10 ]; then
        echo "|                                        level: $level point: $point      |"
    elif [ $point -gt 9 ] && [ $point -lt 100 ]; then
        echo "|                                        level: $level point: $point     |"
    else
        echo "|                                               please STOP!!!  |"
    fi
    echo "+---------------------------------------------------------------+"
    update_characters
    tput cup 39 0
    echo "|_______________________________________________________________|"
}

#**************************************************************************************************

read_input()
{
    if read -n 1 -t 0; then
        read -n 1 input
    fi
}

level_speed()
{
    # increse the level, inturn the speed, with every 10 points
    level=$((point / 10 + 1))
    if [ $level -eq 1 ]; then
        sleep 0.5
    elif [ $level -eq 2 ]; then
        sleep 0.2
    elif [ $level -eq 3 ]; then
        sleep 0.1
    else
        level=4
        sleep 0.05
    fi
    # under 50 milliseconds will be very hard
}

#**************************************************************************************************

start_race()
{
    count_down
    while true; do
        clear
        draw_box $player_position
        read_input
        level_speed
        change_position
        if [ $crash -eq 1 ]; then
            sleep 1
            break
        fi
    done
    game_over
}

#**************************************************************************************************
