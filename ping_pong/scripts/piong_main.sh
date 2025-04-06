
ball_x_position=10
ball_y_position=20
player_one_x_position=10
player_one_y_position=5
player_two_x_position=10
player_two_y_position=40

level=1
speed=5
counter=0
x_movement=2
y_movement=2

change_ball_movement()
{
    player_bounce_condition
    wall_bounce_condition
    case $x_movement in
	1)
        ((ball_x_position--))
		;;
	2)
        ((ball_x_position++))
		;;
    *)
        #stunt ball
        ;;
	esac
    case $y_movement in
	1)
        ((ball_y_position--))
		;;
	2)
        ((ball_y_position++))
		;;
    *)
        #stunt ball
        ;;
	esac
}

print_game()
{
    ((counter++))
    if [ $counter -eq $speed ]; then
	    change_ball_movement
        counter=0
    fi
    clear
    tput cup 1 5
    echo "+------------ level: $level ------------+"
    tput cup $ball_x_position $ball_y_position
    echo "o"
    tput cup $player_one_x_position $player_one_y_position
    echo "|"
    tput cup $player_two_x_position $player_two_y_position
    echo "|"
    tput cup 20 5
    echo "+----------------------------------+"
    tput cup 0 0
}

handle_input()
{
    while true; do
        read_input
        case $input in
        "q")
            if [ $player_one_x_position -ge 3 ]; then
                ((player_one_x_position--))
            fi
            ;;
        "a")
            if [ $player_one_x_position -le 18 ]; then
                ((player_one_x_position++))
            fi
            ;;
        "p")
            if [ $player_two_x_position -ge 3 ]; then
                ((player_two_x_position--))
            fi
            ;;
        "l")
            if [ $player_two_x_position -le 18 ]; then
                ((player_two_x_position++))
            fi
            ;;
        "y")
            clear
            tput cup 10 18
            echo "Exiting..."
            tput cup 11 12
            echo "Thank you for playing..."
            sleep 3
            clear
            exit
            ;;
        esac
        input="g"
        print_game
        sleep 0.05
    done
}

piong_animation()
{
    clear
    tput cup 10 16
    print_centered_text "PING PONG" 2
    tput cup 11 20
    print_centered_text "-developed by geNJa" 1
    sleep 3
    clear
}

start_piong()
{
	piong_animation
    clear
	echo
	piong_instructions
	tput cup 8 8
	echo "loading"
	tput cup 8 15
    print_centered_text " ....." 3
    handle_input
}