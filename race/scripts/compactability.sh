
#**************************************************************************************************

### Race on SHELL (compactability.sh) ###
# file that considers different screen sizes #

#**************************************************************************************************

external_display=0

select_parameter()
{
    case "$1" in
        -e|--external_display)
            external_display=1
            ;;
        -h|--help)
            helper_function
            ;;
        *)
            echo
            echo "    loading..."
            sleep 0.2
            clear
            ;;
    esac
}

compactability()
{
    if [ $external_display -eq 1 ]; then
        source ./scripts/external_display/ext_screen_animation.sh
        source ./scripts/external_display/ext_screen_main.sh
        source ./scripts/external_display/ext_screen_update.sh
        source ./scripts/external_display/ext_screen_utility.sh
    else
        source ./scripts/animation.sh
        source ./scripts/main.sh
        source ./scripts/update.sh
        source ./scripts/utility.sh
    fi
}

start_game()
{
    select_parameter $1
    compactability
    start_animation
    instruction_function
    start_race
}

#**************************************************************************************************
