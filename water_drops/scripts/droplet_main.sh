
droplet_startup_animation()
{
    tput cup 15 60
    echo "Peace Maker"
    tput cup 16 70
	echo " developed by geNJa"
	sleep 1
    if [ $enable_matrix -eq 1 ]; then
		tput cup 20 15
		for i in {1..2}; do
        	print_all_symbols
			tput cup 10 15
		done
		sleep 2
    fi
}

print_droplet()
{
    cursor=$(echo -e "\033[${current_row_number};${random_column}H")
    echo -e "$cursor $2 $char"
}

draw_line()
{
    current_row_number=$1
    char=$(print_random_symbol)
    print_droplet $current_row_number $2 $char
}

erase_line()
{
    current_row_number=$1
    char=$space_char
    print_droplet $current_row_number $2 $char
}

start_animation()
{   
    random_column=$((RANDOM % total_column))
    random_row=$(echo $(( (RANDOM % $total_rows) + 1)))

    for row_number in $(seq 1 $total_rows ); do 
        draw_line $[row_number-1] $colour
        if [ $enable_matrix -eq 1 ]; then
            draw_line $row_number $colour_white
        fi
        sleep $speed;
        if [ $row_number -ge $random_row ]; then 
            erase_line $[row_number-random_row]
        fi;
    done;

    for row_number in $(seq $[row_number-$random_row] $total_rows); do 
        erase_line $row_number
        sleep $speed
    done
}

droplet()
{
    clear
    select_parameter $1
    droplet_initialize
    droplet_startup_animation
    clear
    while true; do
        start_animation &
        if [ $enable_matrix -eq 1 ]; then
            sleep 0.2
        else
            sleep 0.5
        fi
    done
}
