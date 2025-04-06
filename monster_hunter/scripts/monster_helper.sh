
trap 'handle_interrupt' SIGINT
handle_interrupt()
{
    clear
    tput cup 10 25
    echo "Sad to see you go..."
    sleep 1.5
    clear
	exit_animation
    exit 0
}

player_status()
{
	echo
	echo "Player Stats:"
	echo " Health: $player_current_health"
	echo " Experience: $player_attack_rate"
	echo " Gold: $player_gold"
	echo
}

base_info()
{
	clear
	echo "================================"
	echo "        Monster Hunt            "
	echo "================================"
	player_status
	echo "Options:"
	echo "1. Explore"
	echo "2. Go back to base"
	echo "3. Quit"
}

moster_attack_rate()
{
	if [ $monster_level -eq 1 ]; then
		monster_attack_min=1
		tput cup 5 0
		monster_level1
		sleep 1
	elif [ $monster_level -eq 2 ]; then
		monster_attack_min=6
		tput cup 5 0
		monster_level2
		sleep 1
	elif [ $monster_level -eq 3 ]; then
		monster_attack_min=11
		tput cup 5 0
		monster_level3
		sleep 1
	elif [ $monster_level -eq 4 ]; then
		monster_attack_min=16
		tput cup 5 0
		monster_level4
		sleep 1
	elif [ $monster_level -eq 5 ]; then
		monster_attack_min=21
		tput cup 5 0
		monster_level5
		sleep 1
    else
		monster_attack_min=25
	fi
	monster_attack_max=5
}

monster_encounter_helper()
{
	while [ $monster_health -gt 0 ]; do
		echo
		read -p "Options: 1. Attack, 2. Run: " action
		case $action in
		1)
			# player attacks
			if [ $player_current_health -gt 0 ]; then
				player_damage=$((RANDOM % $player_attack_rate + 1))
				monster_health=$((monster_health - player_damage))
				echo "    You dealt $player_damage damage to the monster"
			fi

			# monster attacks
			if [ $monster_health -gt 0 ]; then
				monster_damage=$((RANDOM % $monster_attack_max + monster_attack_min))
				player_current_health=$((player_current_health - monster_damage))
				echo "    The monster dealt $monster_damage damage to you."
			fi
			;;
		2)
			clear
			tput cup 10 20
			echo "      You run away from the monster"
			break
			;;
		*)
			echo "Invalid choice. Try again"
			;;
		esac
		if [ $player_current_health -le 0 ]; then
			clear
			tput cup 9 10
			echo "    You were defeated by the monster. Game over!"
			end_game
		elif [ $monster_health -le 0 ]; then
			clear
			player_gold=$((player_gold + monster_level))
			tput cup 10 20
			echo "    You have defeated the monster..."
			tput cup 11 25
			echo "       You found $monster_level gold!"
            break
		fi
		health_bar
	done
}

monster_encounter()
{
	monster_level=$((RANDOM % 5 + 1))
	monster_health=$((monster_level * 5))
	moster_attack_rate

	echo "Monster level: $monster_level"
	echo " monster health: $monster_health"
	echo " monster attack rate: $((monster_health - 4)) to $monster_health"
    monster_encounter_helper

	player_attack_rate=$((player_attack_rate + 2))
	tput cup 12 20
	echo "    experience incresed by two points"
}

treasure_encounter()
{
	rotate_coin
	tput cup 10 20
	found_gold=$((RANDOM % 3 + 1))
	echo "Found $found_gold gold coins inside"
	player_gold=$((player_gold + found_gold))
}

shop_action()
{
	clear
	echo
	echo "increase your maximum health?"
	echo "    10 gold coins -> maximum health of 25"
	echo "    20 gold coins -> maximum health of 30"
	echo "    you need to buy 25 first, later can buy 30"
	echo "    you can also refill health with this option"
	echo
	echo " press 'ENTER' to continue"
	read -p ""
	if [ $player_max_health -gt 25 ]; then
		echo " sorry, you have used up all the portions in this shop"
		sleep 0.5
	elif [ $player_max_health -gt 20 -a $player_gold -ge 20 ]; then
		echo " converting gold to health....."
		player_max_health=30
		player_current_health=30
		player_gold=$((player_gold - 20))
        sleep 1
        echo " convertion successful"
		player_current_health=30
	elif [ $player_gold -ge 10 ]; then
		echo " converting gold to health..."
		player_max_health=25
		player_current_health=25
		player_gold=$((player_gold - 10))
        sleep 0.5
        echo " convertion successful"
	else
		echo " you don't have enough gold"
        echo " convertion unsuccessful"
	fi
}

rest_action()
{
	display_sleep
	tput cup 16 10
	echo "You decide to rest and recover some health"
	echo "                           healing..."
	rest_health=$((RANDOM % 6 + 5))
	player_current_health=$((player_current_health + rest_health))
	if [ $player_current_health -gt $player_max_health ]; then
		player_current_health=$player_max_health
	fi
}
