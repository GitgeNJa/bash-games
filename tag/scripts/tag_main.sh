
catcher_x_position=0
catcher_y_position=0
runner1_x_position=19
runner1_y_position=19
runner2_x_position=17
runner2_y_position=17
box_width=20
box_height=20

select_parameter()
{
    case "$1" in
        -m|--multi)
			multiplayer_enable=1
            ;;
        *)
            multiplayer_enable=0
            ;;
    esac
}

cleanup()
{
    clear
	tput cup 10 10
	echo "Sad to see you leave :("
	sleep 2
	clear
    exit
}

tag_animation()
{
	clear
	tput cup 5 0
	echo "  ================================================"
	echo " |                   Tag Game                     |"
	echo "  ================================================"
	tput cup 8 30
    echo "- developed by geNJa"
    running_points
	sleep 2
}

tag_main()
{
	tag_animation
	clear
    echo
    tag_helper
    echo
    read -p " press 'ENTER' to continue"
    clear
	echo
    tag_instruction
	echo
    read -p " press 'ENTER' to continue"

	while true; do
		draw
		handle_input
		character_condition
	done
}

start_tag()
{
	select_parameter $1
	trap cleanup INT
	tag_main
}
