# TXXLog

This project is a web application for amateur radio contest logging. 

:bangbang: Status: Minimum Viable Product. Has basic logging abilities specific to Winter Field Day. Aiming for more generic contest/qso support by Field Day in June 2020.

The goals:
* modern web technology to allow flexibility of client devices with any OS
* Multi-user and multi-station logging
* Easy to use UI that allows efficient operation
* Deployable on a Raspberry Pi for field operation

## TODO List
- [x] Add views and forms to be able to complete basic interactions for WFD
- [ ] Cabrillo file export
- [ ] Add basic websocket support for realtime interaction
- [ ] Support more generic contest format, not just Winter Field Day

## Development

This is a Ruby on Rails 6 application.

### Initialize Database

It's currently using sqlite for the database, so it should be automatically created when the server starts.

### Install dependencies
```
bundle install
yarn install
bundle exec rake assets:precompile
```


### Start the server
```bundle exec rails s```

Access the server at http://localhost:3000/

To allow connections not just from localhost:

```bundle exec rails s -b 0.0.0.0```

### Start an interactive console
```bundle exec rails c```

## Deploy

TODO instructions for running application with docker, including raspberry pi specific instructions.
