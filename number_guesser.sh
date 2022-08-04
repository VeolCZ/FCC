#!/bin/bash
clear
# db has to have table username, games played, best game
# Generate random number between 1 and 1000
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUMBER=$((1 + $RANDOM % 1000))
echo $RANDOM_NUMBER
typeset -i NUMBER_OF_GUESSES=1
# Ask for info
echo "Enter your username:"
read USERNAME #database limit 22 char

ID=$($PSQL "SELECT id FROM users WHERE username='$USERNAME'")
#if username not in database
if [[ -z $ID ]]
then
  IS_NEW=true
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
#else
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE id=$ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE id=$ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


# guesssing game
echo "Guess the secret number between 1 and 1000:"
read GUESS

while (( $GUESS != $RANDOM_NUMBER ))
do 
  NUMBER_OF_GUESSES=NUMBER_OF_GUESSES+1
  # if not integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESS
  elif [[ $GUESS < $RANDOM_NUMBER ]]
  then
    # if guess was higher
    echo "It's higher than that, guess again:"
    read GUESS
  elif [[ $GUESS > $RANDOM_NUMBER ]]
  then
    # if guess was lower
    echo "It's lower than that, guess again:"
    read GUESS
  fi
done

# if correct
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"

if [[ -z $IS_NEW ]]
then
  if [[ $NUMBER_OF_GUESSES < $BEST_GAME ]]
  then
    REMOVE_USER=$($PSQL "DELETE FROM users WHERE id=$ID")
    INSERT_USER=$($PSQL "INSERT INTO users(id, games_played, best_game, username) VALUES($ID, ($GAMES_PLAYED+1), $BEST_GAME, '$USERNAME')")
  else
    REMOVE_USER=$($PSQL "DELETE FROM users WHERE id=$ID")
    INSERT_USER=$($PSQL "INSERT INTO users(id, games_played, best_game, username) VALUES($ID, ($GAMES_PLAYED+1), $NUMBER_OF_GUESSES, '$USERNAME')")
  fi
else
  ID=$($PSQL "SELECT id FROM users WHERE username='$USERNAME'")
  REMOVE_USER=$($PSQL "DELETE FROM users WHERE id=$ID")
  INSERT_USER=$($PSQL "INSERT INTO users(id, games_played, best_game, username) VALUES($ID, ($GAMES_PLAYED+1), $NUMBER_OF_GUESSES, '$USERNAME')")
fi

