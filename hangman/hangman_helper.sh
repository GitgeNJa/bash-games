
declare -a guessed_letters
max_attempts=6
attempts=0
level=1

word_listing()
{
    word_list1=("air" "bat" "cat" "dog" "eye" "fish" "gift" "hen" "ink")
    word_list2=("aeroplane" "butterfly" "carrot" "dinosaur" "elephant")
    word_list3=("abcdefg" "qwerty" "george" "genja" "hangman" "w")
    word_list4=("pneumonoultramicroscopicsilicovolcanoconiosis" \
                "hippopotomonstrosesquippedaliophobia" \
                "supercalifragilisticexpialidocious" \
                "antidisestablishmentarianism")
}

select_level()
{
	clear
	echo "level $level"
	if [ $level -eq 1 ]; then
		selected_word=${word_list1[RANDOM % ${#word_list1[@]}]}
		level=2
	elif [ $level -eq 2 ]; then
		selected_word=${word_list2[RANDOM % ${#word_list2[@]}]}
		level=3
	elif [ $level -eq 3 ]; then
		selected_word=${word_list3[RANDOM % ${#word_list3[@]}]}
		level=4
	elif [ $level -eq 4 ]; then
		selected_word=${word_list4[RANDOM % ${#word_list4[@]}]}
		level=5
    else
        clear
        tput cup 5 10
        echo "Wow... you are an actual genius!!!"
        tput cup 6 12
        echo "Thank you for playing..."
        sleep 3
        clear
        exit
	fi
	word_length=${#selected_word}
}

display_word()
{
	display=""
  	for ((i = 0; i < $word_length; i++)); do
		# extracting a single character from 'i'th position
		letter="${selected_word:$i:1}"
		# check if the letter is in the 'guessed_letters' list
		# uses the 'regular expression matching operator' =~
		if [[ "${guessed_letters[@]}" =~ "$letter" ]]; then
			display+=" $letter"
		else
			display+=" _"
		fi
  	done
  	echo "Word: $display"
}

start_game()
{
	while [ $attempts -lt $((max_attempts + 1)) ]; do
		echo
		display_word
		read -p "Enter a letter: " guess

		if [[ ! "$guess" =~ ^[a-z]$ ]]; then
			echo "Invalid input. Please enter a single small letter."
			continue
		fi

		if [[ "${guessed_letters[@]}" =~ "$guess" ]]; then
			echo "You already guessed that letter. Try again."
			continue
		else
			guessed_letters+=("$guess")
		fi

		if [[ ! "$selected_word" =~ "$guess" ]]; then
			echo "Incorrect guess! Try again."
			echo "remaining number of guesses $((max_attempts - attempts))"
			((attempts++))
		fi

		# checks for any occurrences of the underscore character
		if [ "$(display_word | grep '_')" == "" ]; then
			echo "Congratulations! You guessed the word: $selected_word"
			unset guessed_letters
			attempts=0
			read -p "" temp
			select_level
		fi
	done
}

play_hangman()
{
    read -p "" temp
    word_listing
    select_level
    start_game
    echo
    echo "Sorry, you ran out of attempts"
    echo "The correct word was $selected_word"
    sleep 3
    clear
}
