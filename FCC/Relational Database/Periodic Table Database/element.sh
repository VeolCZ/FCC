#/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# if condition
if [[ -z $1  ]]
then
  # return result
  echo "Please provide an element as an argument."
else
  # second if condition
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    DATA=$($PSQL "SELECT * FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number='$1'")
  elif [[ ! $1 =~ ^[0-9]+$ ]]
    then
      DATA=$($PSQL "SELECT * FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
  fi

  #if not in databaseW
  if [[ -z $DATA  ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$DATA" | while read TYPE_ID BAR ATOMIC_NUMBER BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS BAR SYMBOL BAR NAME BAR TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi  
fi

