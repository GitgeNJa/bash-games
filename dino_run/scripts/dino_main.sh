
dino_y_position=20
cloud_y_position=12
cactus_y_position=20
ground_y_position=21

dino_x_position=8
cloud_x_position=10
cactus_x_position=24
ground_x_position=0

points=0
safe_zone=0
cloud_delay=0

dino_animation()
{
    clear
    tput cup 10 20
    print_centered_text "Dino Run" 2
    sleep 0.5
    tput cup 11 25
    print_centered_text "-developed by geNJa" 1
    sleep 2
}

start_game()
{
    while true; do
		print_all
		read_input
		case $input in
		w)
			print_dino_jump
			sleep 0.01
			input=g
			;;
		q)
			clear
			tput cup 5 10
			echo "Sad to see you leave :("
			sleep 3
			clear
			exit
			;;
		esac
	done
}

start_dino_run()
{
	dino_animation
    clear
    echo
	dino_instructions
    sleep 2
    start_game
}
