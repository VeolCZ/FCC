#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo "Welcome to My Salon, how can I help you?" 
  echo -e "\n1) cut\n2) trim\n3) color\n"
  # ask for credentials
  echo -e "What service would you like"
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    echo "I could not find that service. What would you like today?"
    echo -e "\n1) cut\n2) trim\n3) color\n"
    read SERVICE_ID_SELECTED  
  fi
  echo -e "What's your phone number?"
  read CUSTOMER_PHONE
  # get name from database
  # if name not in database
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # insert new customer into database 
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  # ask for appointment time
  echo -e "When are you available?"
  read SERVICE_TIME
  #add appointments to database
  #format: running your script and entering 1, 555-555-5555, Fabio, 10:30
  #The row should have the customer_id for that customer, and the service_id for the service entered
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, service_id, customer_id) VALUES('$SERVICE_TIME', $SERVICE_ID_SELECTED, $CUSTOMER_ID)")
  #after appointment print messages:
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}

MAIN_MENU

