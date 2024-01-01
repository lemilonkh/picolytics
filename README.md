# Picolytics
A tiny analytics stack built on top of [attolytics](https://github.com/lemilonkh/attolytics) and [Metabase](https://metabase.com).  
Provides an API endpoint to send analytics events to.

For details see the respective project's documentation.

## Setup
- Install docker & docker-compose
- Configure your database schema, app name and secret_key in schema.conf.yml
- Copy .env.sample to .env and replace passwords
- Add your hostname to nginx.conf (instead of localhost)
- Run `docker-compose up -d`
- Navigate to [localhost:3000](http://localhost:3000) to access the Metabase UI
- Send API requests to `POST http://localhost:8000/apps/com.example.yourapp` to store them
- (optional) run `./cron-backup.sh add` to automatically create database backups on a schedule (by default at 22:00 each day)
