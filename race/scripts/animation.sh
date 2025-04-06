
#**************************************************************************************************

### Race on SHELL (animation.sh) ###
# this script simulate the starting animation on the terminal screen #

#**************************************************************************************************

car_one()
{
    local first_position=$1
    tput cup 30 0
    printf "%${first_position}s"
    echo "  _______"
    printf "%${first_position}s"
    echo " //  ||  \\_____"
    printf "%${first_position}s"
    echo "(..| [_] |......o"
    printf "%${first_position}s"
    echo "\__\_____/______J"
    printf "%${first_position}s"
    echo "   (o)     (o)    "

    #road
    for ((i = 10; i <= ${first_position}; i++)); do
        printf "."
    done
}

car_two()
{
    local second_position=$((140 - $1))
    tput cup 10 0
    printf "%${second_position}s"
    echo "       _______"
    printf "%${second_position}s"
    echo " _____//  ||  \\"
    printf "%${second_position}s"
    echo "(______|_[_]|__\\"
    printf "%${second_position}s"
    echo "    (o)     (o)  "
}

car_animation()
{
    for ((position = 0; position <= 120; position++)); do
        clear
        car_one $position
        if [ ${position} -gt 20 ]; then
            car_two $position
        fi
        sleep 0.02
    done
}

#**************************************************************************************************

title_animation()
{
    sleep 1
    tput cup 18 70
    print_centered_text "Race on SHELL" 1
    tput cup 19 80
    print_centered_text "-developed by geNJa" 2
    sleep 2
}

#**************************************************************************************************

start_animation()
{
    clear
    car_animation
    title_animation
    clear
}

#**************************************************************************************************
