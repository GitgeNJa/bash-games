
initialize_frames()
{
	counter=1

	frame_0="▓     "
	frame_1="▓▓    "
	frame_2="▓▓▓   "
	frame_3="▓▓▓▓  "
	frame_4="▓▓▓▓▓ "
	frame_5="▓▓▓▓▓▓"
	frame_6=" ▓▓▓▓▓"
	frame_7="  ▓▓▓▓"
	frame_8="   ▓▓▓"
	frame_9="    ▓▓"
	frame_a="     ▓"
	frame_b="    ▓▓"
	frame_c="   ▓▓▓"
	frame_d="  ▓▓▓▓"
	frame_e=" ▓▓▓▓▓"
	frame_f="▓▓▓▓▓▓"
	frame_g="▓▓▓▓▓ "
	frame_h="▓▓▓▓  "
	frame_i="▓▓▓   "
	frame_j="▓▓    "
	frames=("$frame_0" "$frame_1" "$frame_2" "$frame_3" "$frame_4" \
		"$frame_5" "$frame_6" "$frame_7" "$frame_8" "$frame_9" \
		"$frame_a" "$frame_b" "$frame_c" "$frame_d" "$frame_e" \
		"$frame_f" "$frame_g" "$frame_h" "$frame_i" "$frame_j")
}

draw_snake1()
{
	echo "     __"
	echo "    /  \\_"
	echo "   (     @\\____"
	echo "   /          O"
	echo "  /   (_____ /"
	echo " /_____/"
	echo "(_____)"
	echo "_____)"
	echo "___)"
	echo "_)"
}

draw_snake2()
{
	echo "     __"
	echo "    /  \\_"
	echo "   (     @\\____"
	echo "   /          O"
	echo "  /   (_____ /"
	echo " /_____/  UU"
	echo "(_____)"
	echo "_____)"
	echo "___)"
	echo "_)"
}

draw_snake3()
{
	echo "     __"
	echo "    /  \\_"
	echo "   (     @\\____"
	echo "   /          O"
	echo "  /   (_____ /"
	echo " /_____/  ||"
	echo "(_____)     &&"
	echo "_____)"
	echo "___)"
	echo "_)"
}

count_down()
{
    for ((i = 3; i != 0; i--)); do
        clear
        tput cup 10 35
        echo $i
        sleep 1
    done
    clear
    tput cup 10 34
    echo "Start"
    sleep 1
    clear
}

snake_head_animation()
{
	clear
	tput cup 5 0
	if [ $counter -eq 1 ]; then
		draw_snake1
		counter=2
	elif [ $counter -eq 2 ]; then
		draw_snake1
		counter=3
	elif [ $counter -eq 3 ]; then
		draw_snake2
		counter=4
	elif [ $counter -eq 4 ]; then
		draw_snake3
		counter=5
	elif [ $counter -eq 5 ]; then
		draw_snake3
		counter=0
	else
		draw_snake3
		counter=1
	fi
}

snake_animation()
{
	initialize_frames
	clear
	tput cup 5 20
	echo " ___________________"
	tput cup 6 20
	echo "|  Snake Bite Game  |"
	tput cup 7 20
	echo " -------------------"
	tput cup 9 20
    echo " developed by geNJa"
	sleep 3
	for i in {1..3}; do
		for frame in "${frames[@]}"; do
			snake_head_animation
			tput cup 10 30
			echo "loading $frame"
			tput cup 0 0
			sleep 0.05
		done
	done
	clear
}
