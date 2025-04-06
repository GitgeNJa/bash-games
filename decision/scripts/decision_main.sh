
decision_intro()
{
    clear
    tput cup 10 5
    echo "Do you ever face any doubt in taking a critical decision?"
    sleep 1.5
    tput cup 12 30
    echo "Never again"
    sleep 1.5
    tput cup 14 29
    echo "Introducing..."
    sleep 1.5
    clear
    tput cup 10 0
    decision_heading
    sleep 3
}

print_helper_coin()
{
    sleep $frame
    clear
    tput cup 3 0
}

rotate_coin()
{
    clear
    frames=(0.1 0.05 0.02)
    for frame in "${frames[@]}"; do
        for i in {1..3}; do
            coin_rotate1
            coin_rotate2
            coin_rotate3
            coin_rotate4
        done
    done
    frame=0.1
    coin_rotate1
    frame=0.2
    coin_rotate2
    frame=0.3
    coin_rotate3
    frame=0.4
    coin_rotate4
    frame=0.5
    clear
}

toss_coin()
{
    rotate_coin
    result=$((RANDOM % 2))
    if [ $result -eq 0 ]; then
        coin_head
        tput cup 33 18
        echo " its a Head"
    else
        coin_tail
        tput cup 33 18
        echo " its a Tail"
    fi
    tput cup 34 10
    echo "  press 'ENTER' to continue"
    read -p ""
}

select_die_face()
{
    clear
    tput cup 10 0
    case "$result" in
        1)
            die_face_one
            ;;
        2)
            die_face_two
            ;;
        3)
            die_face_three
            ;;
        4)
            die_face_four
            ;;
        5)
            die_face_five
            ;;
        6)
            die_face_six
            ;;
        *)
            die_face_zero
            ;;
    esac
}

roll_die()
{
    for result in {6..0}; do
        select_die_face
        sleep 0.5
    done
    sleep 0.5
    result=$((1 + RANDOM % 6))
    select_die_face
    tput cup 20 15
    echo "rolled a $result"
    tput cup 21 8
    echo " press 'ENTER' to continue"
    read -p ""
}

decide()
{
    #decision_intro
    while true; do
        clear
        echo
        echo " Do you want to:"
        echo "  1. toss a coin"
        echo "  2. roll a die"
        echo "  3. exit"
        echo
        read -p "" choice
        case "$choice" in
            1)
                clear
                tput cup 15 15
                echo "Tossing a coin..."
                sleep 1
                toss_coin
                ;;
            2)
                clear
                tput cup 10 10
                echo "Rolling a six-sided die..."
                sleep 1
                roll_die
                ;;
            3)
                clear
                tput cup 10 10
                echo "Exiting..."
                sleep 1
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
