
# set non-blocking mode for read with a timeout of 0
exec 3<>/dev/tty
stty -icanon min 0 time 0 <&3

read_input()
{
    if read -n 1 -t 0; then
        read -n 1 input
    fi
}

print_centered_text()
{
    text=$1
    speed=$2
    for ((i = 0; i < ${#text}; i++)); do
        echo -n "${text:$i:1}"
        if [ "${speed}" -eq 1 ]; then
            sleep 0.05
        elif [ "${speed}" -eq 2 ]; then
            sleep 0.1
        elif [ "${speed}" -eq 3 ]; then
            sleep 0.5
        fi
    done
}

game_over()
{
    clear
    tput cup 10 30
    print_centered_text "Game over" 1
    print_centered_text " ..." 1
    tput cup 11 30
    print_centered_text "[points recived: $point]" 1
    sleep 2
    clear
    exit
}

level_speed()
{
    # increse the level, inturn the speed, with every 10 points
    level=$((point / 5 + 1))
    if [ $level -eq 1 ]; then
        sleep 0.2
    elif [ $level -eq 2 ]; then
        sleep 0.1
    elif [ $level -eq 3 ]; then
        sleep 0.05
    else
        level=4
        sleep 0.02
    fi
    # under 20 milliseconds will be very hard
}
