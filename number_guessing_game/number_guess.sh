#!/bin/bash
RANDOM_NUMBER=$(($RANDOM%1000 + 1))
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
INJECTION_CHARACTERS="['\";]|--"
GUESSES=0

echo -e "\nEnter your username:"
read USER_NAME

# escaping potential injection
if [[ ! $USER_NAME =~ ^[a-zA-Z0-9_-]+$ ]]
then
  echo -e "\nInvalid characters in user name"
  exit 0
fi

USER_EXIST=$($PSQL "SELECT 1 FROM users WHERE name='$USER_NAME'")
if [[ -z $USER_EXIST ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(name) VALUES('$USER_NAME')")
  if [[ -z $INSERT_USER ]]
  then
    echo "Something went wrong inserting user"
  fi
fi

IFS="|" read USER_ID USER_NAME USER_GAMES USER_BEST <<< $($PSQL "SELECT user_id,name,COUNT(game_id), MIN(score) FROM users LEFT JOIN games USING(user_id) WHERE name = '$USER_NAME' GROUP BY user_id")

if [[ -z $USER_EXIST ]]
then
  echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
else
  echo -e "\nWelcome back, $USER_NAME! You have played $USER_GAMES games, and your best game took ${USER_BEST:-0} guesses."
fi


GUESSING_GAME() {
  ((GUESSES++))
  if [[ -z $1 ]]
  then
    echo -e "\nGuess the secret number between 1 and 1000:"
  else
    echo -e "\n$1"
  fi
  read USER_GUESS
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    GUESSING_GAME "That is not an integer, guess again:"
    return
  elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
  then
    GUESSING_GAME "It's higher than that, guess again:"
    return
  elif [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
  then
    GUESSING_GAME "It's lower than that, guess again:"
    return
  else 
    # Victory condition
    INSERT_GAME=$($PSQL "INSERT INTO games(user_id,score) VALUES($USER_ID,$GUESSES)")
    if [[ -z $INSERT_GAME ]]
    then
      echo -e "\nSomething went wrong saving game data"
    fi
    echo -e "\nYou guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  fi
}

GUESSING_GAME 