# Nervos CITA Server
[![Build Status](https://travis-ci.org/CITA-Toys/nervos-cita-server.svg?branch=develop)](https://travis-ci.org/CITA-Toys/nervos-cita-server)

provide data server for Nervos CITA website

## Packages

    - imagemagick
    - postgresql 9.4 and above

## Initial Project

```shell
touch .env.local # read .env config database, mail and so on

rails db:create

rails db:migrate
```

## Running Test

```shell
rails test
```

## Run Project

```shell
rails s
./bin/webpack-dev-server
```
