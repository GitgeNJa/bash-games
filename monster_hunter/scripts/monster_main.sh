
# Player stats
player_max_health=20
player_current_health=20
player_attack_rate=5
player_gold=0

end_game()
{
	tput cup 10 25
	echo "Thank you for playing..."
	read -p ""
	clear
	exit_animation
}

goto_forest()
{
	display_forest
	player_current_health=$((player_current_health - 1))
	if [ $player_current_health -le 0 ]; then
		clear
		tput cup 9 27
		echo "Very low life"
		end_game
	fi
	encounter=$((RANDOM % 3))
	case $encounter in
	0)
		player_status
		monster_encounter
		;;
	1)
		treasure_encounter
		;;
	2)
		tput cup 10 10
		echo "You didn't find anything interesting :|"
		;;
	esac
}

goto_base()
{
	display_base
	read -p " Options: 1. Shop, 2. Rest: " base_action
	case $base_action in
	1)
		shop_action
		;;
	2)
		rest_action
		;;
	*)
		echo "Invalid choice. Try again"
		;;
	esac
}

start_game()
{
	while [ $player_attack_rate -le 100 ]; do
		base_info
		read -p "Enter your choice (1-3): " choice
		case $choice in
		1)
			goto_forest
			;;
		2)
			goto_base
			;;
		3)
			clear
			tput cup 9 27
			echo "Sad to see you leave"
			end_game
			;;
		*)
			echo "Invalid choice. Try again."
			;;
		esac
		read -p ""
	done
	clear
	tput cup 9 10
	echo "Sorry. But your attack-rate is too powerful for this game"
	end_game
}
