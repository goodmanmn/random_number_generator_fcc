#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

RANDOM_NUMBER=$((1 + RANDOM % 1000))
COUNT=0

LENGTH_OK=0
while [[ $LENGTH_OK = 0 ]]
do
  echo "Enter your username: "
  read USERNAME
  LENGTH=${#USERNAME}
  if [ $LENGTH -gt 22 ];
    then
      echo "Username must be 22 characters or less"
    else
      LENGTH_OK=1
  fi
done

USERNAME_CHECK=$($PSQL "SELECT * FROM user_data WHERE username='$USERNAME'")

if [[ -z $USERNAME_CHECK ]]
  then
    INSERT_USER=$($PSQL "INSERT INTO user_data(username, games_played, best_game) VALUES ('$USERNAME', 0, 0)")
  
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    echo $USERNAME_CHECK | while IFS=\| read ID DB_USERNAME GAMES_PLAYED BEST_GAME
    do
      ADJ_DB_USERNAME=$(echo "$DB_USERNAME" | sed -r 's/^ *| *$//g')
      ADJ_GAMES_PLAYED=$(echo "$GAMES_PLAYED" | sed -r 's/^ *| *$//g')
      ADJ_BEST_GAME=$(echo "$BEST_GAME" | sed -r 's/^ *| *$//g')
      echo "Welcome back, $ADJ_DB_USERNAME! You have played $ADJ_GAMES_PLAYED games, and your best game took $ADJ_BEST_GAME guesses."
    done
fi

echo "Guess the secret number between 1 and 1000: " 
read USER_GUESS

while [ $USER_GUESS != $RANDOM_NUMBER ]
do 
  if [[ $USER_GUESS =~ ^[0-9]+$ ]]
    then
      if [ $USER_GUESS -lt $RANDOM_NUMBER ]
      then
        ((COUNT++))
        echo "It's higher than that, guess again: " 
        read USER_GUESS
      else
        ((COUNT++))
        echo "It's lower than that, guess again: "
        read USER_GUESS
      fi
    else
      echo "That is not an integer, guess again:"
      read USER_GUESS
  fi    
done  
((COUNT++))

echo "You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"

NEW_USERNAME_CHECK=$($PSQL "SELECT * FROM user_data WHERE username='$USERNAME'")
echo $NEW_USERNAME_CHECK | while IFS=\| read ID DB_USERNAME GAMES_PLAYED BEST_GAME
do
ADJ_DB_USERNAME=$(echo "$DB_USERNAME" | sed -r 's/^ *| *$//g')
NEW_GAMES_PLAYED=$((GAMES_PLAYED + 1))
if [ $BEST_GAME = 0 ]
  then 
    NEW_BEST_GAME=$COUNT
  elif [ $COUNT -lt $BEST_GAME ]
  then
    NEW_BEST_GAME=$COUNT
  else
    NEW_BEST_GAME=$BEST_GAME
fi

UPDATE_USER_DATA=$($PSQL "UPDATE user_data SET games_played=$NEW_GAMES_PLAYED, best_game=$NEW_BEST_GAME WHERE username='$ADJ_DB_USERNAME'")

done