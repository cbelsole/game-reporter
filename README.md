# Game Reporter

## Setup for local development

1. Run `vagrant up`
2. Run `vagrant ssh`
3. Run `cd /opt/game_reporter`
4. Run `docker-compose build`
5. Run `docker-compose up`

## Troubleshooting
* You may have to clear out your `tmp/pids/server.pid` file if you see:
```
=> Booting WEBrick
=> Rails 4.2.5.1 application starting in development on http://localhost:3001
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
A server is already running. Check /myapp/tmp/pids/server.pid.
```
