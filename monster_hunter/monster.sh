
#!/bin/bash

source ./scripts/monster_animation.sh
source ./scripts/monster_helper.sh
source ./scripts/monster_main.sh
source ./scripts/monster_utility.sh

monster_instructions()
{
    clear
    echo
    echo " ====================================================================================="
    echo "                                   Monster Hunt                   -developed by geNJa "
    echo " ====================================================================================="
    echo " this is a real time game that requires you to make strategical decisions"
    echo " in this game, you are a monster-hunter and is given different options to choose from"
    echo " 1. you can explore the forest"
    echo "  a. you may find a monster whom you can either attack or run away from"
    echo "  b. find some treasure"
    echo "  c. may not find anything"
    echo " 2. you can go back to the base"
    echo "  a. in the shop you can convert coins to increase your maximum health capacity"
    echo "  b. rest and heal, to increase current health"
    echo " 3. quit the game"
    echo " ====================================================================================="
    echo " How to fight a monster?"
    echo "  when you find a monster, you can either attack or run"
    echo "  you would have to check many things before an attack"
    echo "  monster-attack-rate depends on the level of a monster"
    echo "  it is the range in which the monster attack and that much health is reduce from you"
    echo "  similarly you attack the monster back, between the range of: 1 to your experience"
    echo "  if either of your's health is below zero, they are defeated"
    echo "  so if your heath is below the range of a monster's attack rate,"
    echo "  it would be better to run away for the time-being, or gamble with your life"
    echo "  your experience would increase as you face more monsters"
    echo " ====================================================================================="
    echo
    echo " press 'ENTER' to continue"
    read -p ""
}

monster_instructions
start_animation
start_game
