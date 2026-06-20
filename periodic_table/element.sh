#! /bin/bash
# vulnerable to SQL injection
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_ID=$1
else
  ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1'")
fi

if [[ -z $ELEMENT_ID ]]
then
  echo "I could not find that element in the database."
  exit 0
fi

IFS="|" read ELEMENT_SYMBOL ELEMENT_NAME ELEMENT_MASS ELEMENT_MELTING_POINT ELEMENT_BOILING_POINT ELEMENT_TYPE <<< $($PSQL "SELECT symbol,name,atomic_mass,melting_point_celsius,boiling_point_celsius,type FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$ELEMENT_ID")

echo "The element with atomic number $ELEMENT_ID is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_POINT celsius and a boiling point of $ELEMENT_BOILING_POINT celsius."
# ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ELEMENT_ID")