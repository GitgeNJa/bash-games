

trap 'handle_interrupt' SIGINT
handle_interrupt()
{
    clear
    tput cup 10 25
    echo "Sad to see you go..."
    sleep 2
    clear
    exit 0
}

print_centered_text()
{
    text=$1
    text_speed=$2
    for ((i = 0; i < ${#text}; i++)); do
        echo -n "${text:$i:1}"
        if [ "${text_speed}" -eq 1 ]; then
            sleep 0.05
        elif [ "${text_speed}" -eq 2 ]; then
            sleep 0.1
        elif [ "${text_speed}" -eq 3 ]; then
            sleep 1
        fi
    done
}

generate_number()
{
    clear
    number_one=$((1 + RANDOM % 9))
    number_two=$((1 + RANDOM % 9))
    number_three=$((1 + RANDOM % 9))
    tput cup 2 2
    echo "The number is "
    tput cup 2 15
    print_centered_text "..." 2
    clear
    generate_box
    tput cup 2 5
    echo $number_one
    tput cup 2 13
    echo $number_two
    tput cup 2 21
    echo $number_three
    tput cup 6 0
	echo " press 'ENTER' to continue"
    tput cup 0 0
}

see_condition()
{
    if ([ "$number_one" -eq 0 ] && [ "$number_two" -eq 0 ] && [ "$number_three" -eq 0 ]) || \
       ([ "$number_one" -eq 1 ] && [ "$number_two" -eq 1 ] && [ "$number_three" -eq 1 ]) || \
       ([ "$number_one" -eq 2 ] && [ "$number_two" -eq 2 ] && [ "$number_three" -eq 2 ]) || \
       ([ "$number_one" -eq 3 ] && [ "$number_two" -eq 3 ] && [ "$number_three" -eq 3 ]) || \
       ([ "$number_one" -eq 4 ] && [ "$number_two" -eq 4 ] && [ "$number_three" -eq 4 ]) || \
       ([ "$number_one" -eq 5 ] && [ "$number_two" -eq 5 ] && [ "$number_three" -eq 5 ]) || \
       ([ "$number_one" -eq 6 ] && [ "$number_two" -eq 6 ] && [ "$number_three" -eq 6 ]) || \
       ([ "$number_one" -eq 7 ] && [ "$number_two" -eq 7 ] && [ "$number_three" -eq 7 ]) || \
       ([ "$number_one" -eq 8 ] && [ "$number_two" -eq 8 ] && [ "$number_three" -eq 8 ]) || \
       ([ "$number_one" -eq 9 ] && [ "$number_two" -eq 9 ] && [ "$number_three" -eq 9 ]); then
        sleep 0.5
        clear
        tput cup 2 5
        echo "JACKPOT!!!"
        points=$((points + 1000))
        sleep 3
    else
        points=$((points + number_one + number_two + number_three))
    fi 
}
