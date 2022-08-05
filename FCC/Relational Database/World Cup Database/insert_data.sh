#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#CLEAR
echo $($PSQL "TRUNCATE teams, games")
clear

#LOOP 
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPONENTGOALS
do
  if [[ $YEAR != "year" ]]
  then
    NAMES="$($PSQL "SELECT name FROM teams")"
    if [[ $WINNER != $NAMES ]]
    then
      INSERT_TEAM="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"
    fi
    if [[ $OPPONENT != $NAMES ]]
    then
      INSERT_TEAM="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
    fi
    OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
    WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
    INSERT_GAME="$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', '$WINNERGOALS', '$OPPONENTGOALS', $WINNER_ID, $OPPONENT_ID)")"
  fi
done

