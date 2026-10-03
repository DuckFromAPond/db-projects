#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only --no-align -c"

# show all service options when called
SERVICE_MENU() { 
  # get all available services
  SERVICE_LIST=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICE_LIST" | while IFS="|" read SERVICE_ID NAME
  do
    # print each service replacing all | with empty space 
    echo "$SERVICE_ID) $NAME"
  done
  
  APPOINTMENT_MENU
} 

# for inputing name and time when service selected
APPOINTMENT_MENU() { 
  # get user input 
  read SERVICE_ID_SELECTED 
  # check if user input is not int 
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then 
    # return to service menu
    SERVICE_MENU
    return
  fi 

  # get selected service
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED") 
  # check if service exit 
  if [[ -z $SERVICE_NAME ]] 
  then 
    echo -e "\nI could not find that service. What would you like today?"
    SERVICE_MENU 
    return
  fi 

  # get customer phone
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # get customer name from phone number
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # check if customer exist in db
  if [[ -z $CUSTOMER_NAME ]] 
  then 
    # get new name and insert into db 
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_NAME=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  
  # get appointment time 
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # insert new appointment
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")  
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  
  # exit message
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME." 
} 

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"
SERVICE_MENU