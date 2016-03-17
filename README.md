# Game Reporter

## Setup for local development
1. cd into the game-reporter directory
2. Run `docker-compose build`
3. Run `docker-compose up`
4. Run `docker-machine ip` to obtain docker machine's IP address
5. In your web broswer, use the IP address to connect to port 3000 --> "xxx.xxx.xxx.xxx:3000"


## Troubleshooting
* You may have to clear out your `tmp/pids/server.pid` file if you see:
```
=> Booting WEBrick
=> Rails 4.2.5.1 application starting in development on http://localhost:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
A server is already running. Check /myapp/tmp/pids/server.pid.
```
* If it is complaining that you need to migrate your database run:
```
docker-compose run web bundle exec rake db:migrate
```
