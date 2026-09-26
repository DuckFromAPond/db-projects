#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  # add if not the first rows
  if [[ $YEAR != year ]] 
  then 
    # winner and opponent can be 2 different country so can insert twice/once/none
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # if not in db, insert into teams
    if [[ -z $WINNER_ID ]]
    then
      INSERT_TEAM1=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      # echo $INSERT_TEAM1
      # echo $WINNER
    fi

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # if not in db, insert into teams
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_TEAM2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      # echo $INSERT_TEAM2
      # echo $OPPONENT
    fi

    # find game (using year, round and teams as unique indentifier) 
    FOUND_GAME=$($PSQL "SELECT * FROM games WHERE year='$YEAR' AND winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID' AND round='$ROUND'")

    # check not already in DB 
    if [[ -z $FOUND_GAME  ]] 
    then 
      # insert into games
      INSERT_GAME=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
    fi 
  fi 
done