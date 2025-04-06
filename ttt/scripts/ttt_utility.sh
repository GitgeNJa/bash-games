
top_row=3
mid_row=7
bot_row=11
left_col=3
center_col=11
right_col=19

ttt_heading()
{
    echo " ====================================================================="
    echo "                          Tick Tac Toe           -developed by geNJa  "
    echo " ====================================================================="
}

generate_box()
{
    clear
    ttt_heading
    echo "        |       |       "
    echo "    1   |   2   |   3   "
    echo "        |       |       "
    echo " -------+-------+-------"
    echo "        |       |       "
    echo "    4   |   5   |   6   "
    echo "        |       |       "
    echo " -------+-------+-------"
    echo "        |       |       "
    echo "    7   |   8   |   9   "
    echo "        |       |       "
}

generate_X()
{
    row_num=$1
    col_num=$2
    tput cup $row_num $col_num
    echo "# #"
    tput cup $((row_num + 1)) $col_num
    echo " #"
    tput cup $((row_num + 2)) $col_num
    echo "# #"
}

generate_O()
{
    row_num=$1
    col_num=$2
    tput cup $row_num $col_num
    echo "###"
    tput cup $((row_num + 1)) $col_num
    echo "# #"
    tput cup $((row_num + 2)) $col_num
    echo "###"
}

display_symbol()
{
    case $new_position in
    1)
        if [ "$symbol" -eq 1 ]; then
            generate_X $top_row $left_col
        else
            generate_O $top_row $left_col
        fi
        ;;
    2)
        if [ "$symbol" -eq 1 ]; then
            generate_X $top_row $center_col
        else
            generate_O $top_row $center_col
        fi
        ;;
    3)
        if [ "$symbol" -eq 1 ]; then
            generate_X $top_row $right_col
        else
            generate_O $top_row $right_col
        fi
        ;;
    4)
        if [ "$symbol" -eq 1 ]; then
            generate_X $mid_row $left_col
        else
            generate_O $mid_row $left_col
        fi
        ;;
    5)
        if [ "$symbol" -eq 1 ]; then
            generate_X $mid_row $center_col
        else
            generate_O $mid_row $center_col
        fi
        ;;
    6)
        if [ "$symbol" -eq 1 ]; then
            generate_X $mid_row $right_col
        else
            generate_O $mid_row $right_col
        fi
        ;;
    7)
        if [ "$symbol" -eq 1 ]; then
            generate_X $bot_row $left_col
        else
            generate_O $bot_row $left_col
        fi
        ;;
    8)
        if [ "$symbol" -eq 1 ]; then
            generate_X $bot_row $center_col
        else
            generate_O $bot_row $center_col
        fi
        ;;
    9)
        if [ "$symbol" -eq 1 ]; then
            generate_X $bot_row $right_col
        else
            generate_O $bot_row $right_col
        fi
        ;;
    *)
        echo "Invalid choice"
        sleep 1
        ;;
    esac
}
