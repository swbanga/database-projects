#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SECRET=$(( $RANDOM % 1000 + 1 ))
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  ADD_USER=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
else
  USER_STATS=$($PSQL "SELECT COUNT(game_id), MIN(guesses) FROM users LEFT JOIN games USING (user_id) WHERE name = '$USERNAME'")
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_STATS"
  echo "Welcome back, $USERNAME! You have played ${GAMES_PLAYED:-0} games, and your best game took ${BEST_GAME:-0} guesses."
fi

GUESS_COUNT=0
echo "Guess the secret number between 1 and 1000:"
GUESS() {
  (( GUESS_COUNT += 1 ))
  if [[ $1 ]]
  then
    echo $1
  fi
  read GUESS_NUM
  if [[ ! $GUESS_NUM =~ ^[0-9]+$ ]]
  then
  (( GUESS_COUNT -= 1 ))
    GUESS "That is not an integer, guess again:"

  elif [[ $GUESS_NUM -lt $SECRET ]]
  then
    GUESS "It's higher than that, guess again:"

  elif [[ $GUESS_NUM -gt $SECRET ]]
  then
    GUESS "It's lower than that, guess again:"

  else
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET. Nice job!"
    INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESS_COUNT)")
    exit
  fi

}
GUESS
