
# set non-blocking mode for read with a timeout of 0
exec 3<>/dev/tty
stty -icanon min 0 time 0 <&3

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

read_input()
{
    if read -n1 -t 0; then
        read -n1 input
    fi
}

print_sky()
{
    tput cup $cloud_y_position $cloud_x_position
    echo "       ,--.                                  "
    tput cup $((cloud_y_position + 1)) $cloud_x_position
    echo "   ,--.    )                                 "
    tput cup $((cloud_y_position + 2)) $cloud_x_position
    echo " --         )                                "
    tput cup $((cloud_y_position + 3)) $cloud_x_position
    echo "(____________)                               "

    ((cloud_delay++))
    if [ $((cloud_delay % 4)) -eq 0 ]; then
        ((cloud_x_position--))
        cloud_delay=0
    fi

    if [ $cloud_x_position -eq 0 ]; then
        cloud_x_position=20
    fi
}

print_ground()
{
    tput cup $ground_y_position $ground_x_position
    echo "    TTTTTTTTTTTTTTTTTTTTT"

    tput cup $cactus_y_position $cactus_x_position
    echo "#"

    ((cactus_x_position--))
    if [ $cactus_x_position -eq 3 ]; then
        cactus_x_position=20
        ((points++))
    fi
    if [ $safe_zone -ne 0 ]; then
        ((safe_zone--))
    fi
}

print_background()
{
    print_sky
	print_ground
}

print_dino()
{
    tput cup $((dino_y_position - 1)) $dino_x_position
    echo " "
    tput cup $dino_y_position $dino_x_position
    echo "&"
}

exit_condition()
{
    if [ "$cactus_x_position" -eq 7 -a "$safe_zone" -eq 0 ]; then
        tput cup $dino_y_position $dino_x_position
        echo X
        tput cup 25 2
        echo "You touched the cactus... Game Over..."
        tput cup 26 10
        echo "Won $points points"
        sleep 3
        clear
        exit
    fi
}

print_dino_jump()
{
    safe_zone=2
    tput cup $((dino_y_position - 1)) $dino_x_position
    echo "&"
    tput cup $dino_y_position $dino_x_position
    echo " "
}

print_all()
{
	sleep 0.1
    clear
    dino_instructions
    print_background
    print_dino
    exit_condition
}
