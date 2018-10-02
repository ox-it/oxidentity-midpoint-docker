# oxidentity-midpoint-docker: midPoint Docker containers for the IdM project

This repository contains Docker containers for setting up a simple development midPoint instance.

## How to use

First, install Docker, docker-compose (if necessary) and ideally libnss-docker.

Run the following commands:

    $ docker-compose build
    $ docker-compose up

then visit "http://midpoint.docker:8080" (or optionally "http://localhost:8080/").

## Notes

* The Postgres database has a well-known username and password.  These **MUST** be changed in any real deployment.
