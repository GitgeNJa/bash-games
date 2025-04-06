
print_helper_coin()
{
    sleep 0.1
    clear
    tput cup 2 6
	echo "   You found a hidden treasure chest!"
    tput cup 5 0
}

rotate_coin()
{
    for i in {1..4}; do
        coin_rotate1
        coin_rotate2
        coin_rotate3
        coin_rotate4
    done
    clear
}

print_helper_forest()
{
    clear
    echo "You venture into the dark forest..."
    echo "   [health decreased by one]"
    tput cup 5 0
}

display_forest()
{
    forest1
    forest2
    forest3
}

start_animation()
{
    clear
    display_deer
    sleep 1
    clear
    display_butterfly
    sleep 1
    clear
    display_elephant
    sleep 1
    clear
}

exit_animation()
{
    clear
    display_spider
    sleep 1
    clear
    display_dog
    sleep 1
    clear
    display_horse
    sleep 1
    clear
    exit
}
