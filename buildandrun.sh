#!/usr/bin/env bash

## Close the spring-boot application if is running.
pid=$(ps -o pid:1,command | grep "[s]pring-boot:run -pl modules/voila2sample-web" | cut -d ' ' -f 1)
[[ ! -z "${pid}" ]] && kill "${pid}"
unset pid

## Build the application.
mvn clean install

## Run the application.
mvn spring-boot:run -pl modules/voila2sample-web

## end of script