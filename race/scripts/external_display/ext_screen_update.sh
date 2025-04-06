
#**************************************************************************************************

### Race on SHELL (update.sh) ###
# this script updates the position of all the characters #

#**************************************************************************************************

create_opponent()
{
    # 1:left, 2:center, 3:right
    opponent_position=$((1 + RANDOM % 3))
}


update_player_layer()
{
    create_no_car
    tput cup 32 0
    if [ $player_position -eq 1 ]; then
        create_player_left_car
    elif [ $player_position -eq 2 ]; then
        create_player_center_car
    elif [ $player_position -eq 3 ]; then
        create_player_right_car
    fi
}

update_opponent()
{
    if [ $opponent_position -eq 1 ]; then
        create_opponent_left_car
    elif [ $opponent_position -eq 2 ]; then
        create_opponent_center_car
    elif [ $opponent_position -eq 3 ]; then
        create_opponent_right_car
    fi
}

#**************************************************************************************************

update_final_layer()
{
    # in the final layer there are both cars with 9 combination
    tput cup 32 0
    if [ $player_position -eq 1 ]; then
        if [ $opponent_position -eq 1 ]; then
            crash=1
            last_layer_player_left_1
        elif [ $opponent_position -eq 2 ]; then
            last_layer_player_left_2
        elif [ $opponent_position -eq 3 ]; then
            last_layer_player_left_3
        fi
    elif [ $player_position -eq 2 ]; then
        if [ $opponent_position -eq 1 ]; then
            last_layer_player_center_1
        elif [ $opponent_position -eq 2 ]; then
            crash=1
            last_layer_player_center_2
        elif [ $opponent_position -eq 3 ]; then
            last_layer_player_center_3
        fi
    elif [ $player_position -eq 3 ]; then
        if [ $opponent_position -eq 1 ]; then
            last_layer_player_right_1
        elif [ $opponent_position -eq 2 ]; then
            last_layer_player_right_2
        elif [ $opponent_position -eq 3 ]; then
            crash=1
            last_layer_player_right_3
        fi
    fi
    if [ $EE -eq 1 ]; then
        crash=0
    fi
}

update_first_layer()
{
    tput cup 4 0
    update_opponent
}
update_second_layer()
{
    tput cup 11 0
    update_opponent
}
update_third_layer()
{
    tput cup 18 0
    update_opponent
}
update_fourth_layer()
{
    tput cup 25 0
    update_opponent
}

update_opponent_layers()
{
    if [ $layer_count -eq 1 ]; then
        update_first_layer
        layer_count=2
    elif [ $layer_count -eq 2 ]; then
        update_second_layer
        layer_count=3
    elif [ $layer_count -eq 3 ]; then
        update_third_layer
        layer_count=4
    elif [ $layer_count -eq 4 ]; then
        update_fourth_layer
        layer_count=5
    elif [ $layer_count -eq 5 ]; then
        update_final_layer
        ((point++))
        layer_count=0
    else
        # better to make the first opponent from left
        layer_count=1
        create_opponent
    fi
}

#**************************************************************************************************

update_characters()
{
    update_player_layer
    update_opponent_layers
}

#**************************************************************************************************

change_position()
{
        case $input in
        "a" | "A")
            if [ $player_position -ne 1 ]; then
                ((player_position--))
            fi
            if [ $smoothness -ne 1 ]; then
                clear
                input="g"
            fi
            ;;
        "d" | "D")
            if [ $player_position -ne 3 ]; then
                ((player_position++))
            fi
            if [ $smoothness -ne 1 ]; then
                input="g"
            fi
            ;;
        "e")
            if [ $EE -eq 1 ]; then
                EE=0
            else
                EE=1
            fi
            clear
            create_easter_egg
            sleep 0.5
            input="g"
            ;;
        "s" | "S")
            if [ $smoothness -eq 0 ]; then
                smoothness=1
            else
                smoothness=0
            fi
            input="g"
            ;;
        "q" | "Q")
            game_over
            ;;
        esac
}

#**************************************************************************************************
