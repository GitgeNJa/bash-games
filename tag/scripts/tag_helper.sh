
point1_position=2
point2_position=20

print_points()
{
    tput cup 15 0
    for ((i=0; i<$point1_position; i++)); do
        echo -n " "
    done
    echo -n "X"

    for ((i=$point1_position+1; i<$point2_position; i++)); do
        echo -n " "
    done
    echo "O"

	if [ $multiplayer_enable -eq 1 ]; then
		tput cup 15 45
		echo "0"
	fi
}

running_points()
{
  while [ $point1_position -ne $point2_position ]; do
      print_points
      ((point1_position += 2))
      ((point2_position++))
      sleep 0.1
  done
}

draw()
{
	clear
	for ((i = 0; i < $box_height; i++)); do
		for ((j = 0; j < $box_width; j++)); do
			if [ $i -eq $catcher_y_position ] && [ $j -eq $catcher_x_position ]; then
				echo -n "X "
			elif [ $i -eq $runner1_y_position ] && [ $j -eq $runner1_x_position ]; then
				echo -n "O "
			elif [ $i -eq $runner2_y_position ] && [ $j -eq $runner2_x_position ]; then
				if [ $multiplayer_enable -eq 1 ]; then
					echo -n "0 "
				else
					echo -n ". "
				fi
			else
				echo -n ". "
			fi
		done
		echo
	done
}

handle_input()
{
	read -r -sn1 key
	case $key in
	"w")
		((catcher_y_position--))
		;;
	"s")
		((catcher_y_position++))
		;;
	"d")
		((catcher_x_position++))
		;;
	"a")
		((catcher_x_position--))
		;;
	"i")
		((runner1_y_position--))
		;;
	"k")
		((runner1_y_position++))
		;;
	"l")
		((runner1_x_position++))
		;;
	"j")
		((runner1_x_position--))
		;;
	esac
	if [ $multiplayer_enable -eq 1 ]; then
		case $key in
		"t")
			((runner2_y_position--))
			;;
		"g")
			((runner2_y_position++))
			;;
		"h")
			((runner2_x_position++))
			;;
		"f")
			((runner2_x_position--))
			;;
		esac
	fi
}

character_condition()
{
	if [ "$runner1_x_position" -eq "$catcher_x_position" ] \
	&& [ "$runner1_y_position" -eq "$catcher_y_position" ]; then
		clear
		tput cup 10 10
		echo "catcher caught with the runner 1"
		sleep 2
		clear
		exit
	elif [ $multiplayer_enable -eq 1 ] \
	&& [ "$runner2_x_position" -eq "$catcher_x_position" ] \
	&& [ "$runner2_y_position" -eq "$catcher_y_position" ]; then
		clear
		tput cup 10 10
		echo "catcher caught with runner 2"
		sleep 2
		clear
		exit
	fi

	catcher_x_position=$((catcher_x_position < 0 ? 0 : catcher_x_position))
	catcher_x_position=$((catcher_x_position >= box_width ? box_width - 1 : catcher_x_position))
	catcher_y_position=$((catcher_y_position < 0 ? 0 : catcher_y_position))
	catcher_y_position=$((catcher_y_position >= box_height ? box_height - 1 : catcher_y_position))

	runner1_x_position=$((runner1_x_position < 0 ? 0 : runner1_x_position))
	runner1_x_position=$((runner1_x_position >= box_width ? box_width - 1 : runner1_x_position))
	runner1_y_position=$((runner1_y_position < 0 ? 0 : runner1_y_position))
	runner1_y_position=$((runner1_y_position >= box_height ? box_height - 1 : runner1_y_position))

	if [ $multiplayer_enable -eq 1 ]; then
		runner2_x_position=$((runner2_x_position < 0 ? 0 : runner2_x_position))
		runner2_x_position=$((runner2_x_position >= box_width ? box_width - 1 : runner2_x_position))
		runner2_y_position=$((runner2_y_position < 0 ? 0 : runner2_y_position))
		runner2_y_position=$((runner2_y_position >= box_height ? box_height - 1 : runner2_y_position))
	fi
}
