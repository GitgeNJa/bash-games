
# please do not increse this variable without the developer's permission
# if you are still planning to do it, then he just have one think to tell you
# just do it... Nike
initial_money=20

money=$initial_money
points=0
request=0
number_one=0
number_two=0
number_three=0

deduct_money()
{
    if [ $money -le 0 ]; then
        echo "Sorry, insufficent balence"
    else
        generate_number
        see_condition
        ((money--))
    fi
    read -p "" choice
}

redeem_points()
{
	clear
	echo
	echo " do you really want to redeem your valuble points for dummy cash?"
	echo " press 'ENTER' to continue"
	read -p ""
	money=$((points / 100 + money))
    points=$((points % 100))
}

ask_for_money()
{
    clear
    if [ $request -eq 0 ]; then
        tput cup 2 5
        print_centered_text "Here you go, my boy..." 2
        money=$((money + 20))
        request=1
        sleep 1
    else
        tput cup 2 15
        print_centered_text "Johnny..." 2
        tput cup 3 5
        print_centered_text "     Bloddy rascel..." 2
        tput cup 4 5
        print_centered_text "You will not get any more" 2
        tput cup 5 5
        print_centered_text "         Get out..." 2
        sleep 3
        clear
        exit
    fi
}

gambling()
{
    while true; do
        clear
        echo
        echo " Total points: $points"
        echo " Money in the account: $money"
        echo
        echo " Do you want to make a spin?"
        echo "  press s to spin"
        echo "  press d to redeam the points"
        echo "  press a to ask developer for more money"
        echo "  q to quit gambling :("
        echo
        read -p "" choice
        case "$choice" in
            "s")
                deduct_money
                ;;
            "d")
                redeem_points
                ;;
            "a")
                ask_for_money
                ;;
            "q")
                clear
                tput cup 2 5
                echo "Exiting with Rs.$money"
                tput cup 3 5
                echo "Congratulations..."
                sleep 3
                clear
                exit
                ;;
            *)
                echo "Invalid choice"
                sleep 1
                ;;
        esac
    done
}

start_gamble()
{
    gamble_animation
    gamble_instruction
	echo
    sleep 0.5
    echo "  press 'ENTER' to continue"
    read -p ""
    gambling
}
