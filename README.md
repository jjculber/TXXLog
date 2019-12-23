# TXXLog

This project is a web application for amateur radio contest logging. 

:bangbang: Status: Non-operational. Aiming to be working with limited support for Winter Field Day 2020.

The goals:
* modern web technology to allow flexibility of client devices with any OS
* Multi-user and multi-station logging
* Easy to use UI that allows efficient operation
* Deployable on a Raspberry Pi for field operation

## TODO List
- [ ] Add views and forms to be able to complete basic interactions
- [ ] Cabrillo file export
- [ ] Add basic websocket support for realtime interaction
- [ ] Support more generic contest format, not just Winter Field Day

## Deploy

TODO instructions for running application with docker, including raspberry pi specific instructions.

## Development

This is a Ruby on Rails 6 application.

### Initialize Database

It's currently using sqlite for the database, so it should be automatically created when the server starts.

### Install dependencies
```bundle install```

### Start the server
```bundle exec rails s```
(To allow connections not just from localhost, add `-b 0.0.0.0`)

### Start an interactive console
```bundle exec rails c```

