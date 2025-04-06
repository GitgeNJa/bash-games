
select_parameter()
{
    case "$1" in
        -m|--matrix)
			enable_matrix=1
            ;;
        *)
            enable_matrix=0
            ;;
    esac
}

cleanup()
{
	tput sgr0
    clear
    exit
}

droplet_start()
{
    tput cup 15 60
    echo "Peace Maker"
    tput cup 16 70
	echo "-developed by geNJA"
	sleep 1
    if [ $enable_matrix -eq 1 ]; then
		tput cup 20 10
		for i in {1..2}; do
        	print_all_symbols
			tput cup 10 10
		done
		sleep 2
    fi
}

droplet_colour()
{
	colour_green=$(tput setaf 2)
	colour_blue=$(tput setaf 4)
	colour_white=$(tput setaf 7)

	if [ $enable_matrix -eq 1 ]; then
		colour=$colour_green
	else
		colour=$colour_blue
	fi
}

droplet_initialize()
{
	# set the Unicode range for Malayalam consonant letters
    # https://symbl.cc/en/unicode/table/#kangxi-radicals
	unicode_min=0xD15
	unicode_max=0xD3A
	space_char="\u0020"

	trap cleanup INT

	total_rows=$(( $(tput lines) - 1 ))
	total_column=$(tput cols)
	speed=0.05

	droplet_colour
}

print_all_symbols()
{
    for ((code_point=$unicode_min; code_point<=$unicode_max; code_point++)); do
	    printf " \u$(printf %04x $code_point) "
		sleep 0.01
	done
}

print_random_symbol()
{
	if [ $enable_matrix -eq 1 ]; then
		code_point=$((RANDOM % (unicode_max - unicode_min + 1) + unicode_min))
		printf "\U$(printf %x $code_point)\n"
	else
		echo "0"
	fi
	
}
