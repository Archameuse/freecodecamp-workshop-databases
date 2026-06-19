#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
TRUNCATE=$PSQL "TRUNCATE TABLE teams, games RESTART IDENTITY"
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR == 'year' ]]
  then
    continue
  fi
  # echo $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS
  # get winner team id
  WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  if [[ -z $WINNER_TEAM_ID ]]
  then
    # if no id add team and get it
    # best solution would be to add -q to PSQL and use RETURNING team_id but since specified "Do not change code" need to use 2 queries .-.
    INSERT_WINNER_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  fi
  # get oppo team id
  OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  if [[ -z $OPPONENT_TEAM_ID ]]
  then
    # if no id add team and get it
    # same best solution wouldv been to add -q to PSQL and use RETURNING team_id
    INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  fi
  echo "Winner: $WINNER ($WINNER_TEAM_ID) | Opponent: $OPPONENT ($OPPONENT_TEAM_ID)"
  INSERT_GAME=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_TEAM_ID,$OPPONENT_TEAM_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
  # insert game
  
done