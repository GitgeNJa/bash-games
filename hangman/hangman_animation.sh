
hangman_stages=(
"
                  +---+
                  |   |
                      |
                      |
                      |
                      |
                =========
"
"
                  +---+
                  |   |
                  O   |
                      |
                      |
                      |
                =========
"
"
                  +---+
                  |   |
                  O   |
                  |   |
                      |
                      |
                =========
"
"
                  +---+
                  |   |
                  O   |
                 /|   |
                      |
                      |
                =========
"
"
                  +---+
                  |   |
                  O   |
                 /|\\  |
                      |
                      |
                =========
"
"
                  +---+
                  |   |
                  O   |
                 /|\\  |
                 /    |
                      |
                =========
"
"
                  +---+
                  |   |
                  O   |
                 /|\\  |
                 / \\  |
                      |
                =========
"
)

start_animation()
{
    for stage in "${hangman_stages[@]}"; do
        clear
        tput cup 5 10
        echo "Welcome to the Hangman Game!"
        tput cup 6 30
        echo "-developed by geNJa"
        tput cup 7 0
        echo -e "$stage"
        sleep 0.5
    done
    sleep 1
    clear
    echo
}
