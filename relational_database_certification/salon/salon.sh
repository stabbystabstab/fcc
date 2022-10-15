#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


MAIN_MENU () {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  SERVICES="$($PSQL "select service_id, name from services")"

  if [[ -z $SERVICES ]]
  then
    echo "\nNo services available."
  else
    echo -e "Welcome to my salon. How can I help you?"
    echo "$SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
    read SERVICE_ID_SELECTED
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      MAIN_MENU "You must enter a number"
    else
      GET_SERVICE_RESULT=$($PSQL "select service_id from services where service_id = $SERVICE_ID_SELECTED")
      if [[ -z $GET_SERVICE_RESULT ]]
      then
        MAIN_MENU "That was not a service"
      else
        echo -e "\nWhat is your phone number?"
        read CUSTOMER_PHONE
        GET_CUSTOMER_RESULT=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
        if [[ -z $GET_CUSTOMER_RESULT ]]
        then
          NEW_CUSTOMER $CUSTOMER_PHONE
        fi
        NEW_APPOINTMENT $SERVICE_ID_SELECTED $CUSTOMER_PHONE
      fi
    fi
  fi

}

NEW_CUSTOMER() {
  echo -e "\nWhat is your name?"
  read CUSTOMER_NAME
  INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone, name) values ('$1', '$CUSTOMER_NAME')")
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$1'")
}

NEW_APPOINTMENT() {
  echo -e "\nWhat time would you like to book?"
  read SERVICE_TIME
  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(service_id, customer_id, time) values ($1, (select customer_id from customers where phone = '$2'), '$SERVICE_TIME')")
  SERVICE_NAME=$($PSQL "select name from services where service_id = '$SERVICE_ID_SELECTED'")
  CUSTOMER_NAME="$($PSQL "select name from customers where phone = '$2'")"
  echo -e "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') \
at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g')\
, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}

MAIN_MENU


