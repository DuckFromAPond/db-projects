#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# if no argument is passed in
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# if argument is an int, search with number else use either symbol or name to search 
if [[ $1 =~ ^[0-9]+$ ]]
then
  CONDITION="e.atomic_number = $1"
else
  CONDITION="e.symbol = '$1' OR e.name = '$1'"
fi

# get every information relating to input using the foreign key to join the 3 tables 
RESULT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
  FROM elements e
  INNER JOIN properties p ON e.atomic_number = p.atomic_number
  INNER JOIN types t ON p.type_id = t.type_id
  WHERE $CONDITION"
)

# check for not found 
if [[ -z $RESULT ]]
then
  echo "I could not find that element in the database."
  exit
fi

# read result into individual var for output 
IFS='|' read ATOMIC_NUM NAME SYMBOL TYPE MASS MELT BOIL <<< "$RESULT"

# final output
echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
