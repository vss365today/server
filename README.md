# #vss365 today

> Get the latest #vss365 prompt.


## Background

[_#vss365 today_](https://vss365today.com) is TODO

## Components

_#vss365 today_ is the combination of multiple components, each designed to falicitate
development, duties, and deployment. The following is a brief listing of each
component and their duty.

- **[Web app](https://github.com/le717/vss365today-web)**: A
[Flask-powered](https://flask.palletsprojects.com/en/1.1.x/) web interface for viewing
and downloading prompts.

- **[REST API](https://github.com/le717/vss365today-api)**: A Flask-based REST API that handles
storing, serving, and searching the prompts.

- **[Finder background process](https://github.com/le717/vss365today-finder)**: A background process
that runs on a regulare schedule to find and save the prompt, as well as
trigger daily email notifications.

- **[MariaDB database](https://hub.docker.com/_/mariadb)**:
The primary database for storing all records and information.

- **[Automatic database backups](https://hub.docker.com/r/databack/mysql-backup)**:
Because data backups are important. Process is set to run at midnight UTC.
Backups are located in the `/backup` directory (see below for details).

## Development

You will need to install the following software to run the entire platform on
your computer:

- [Python 3.9+](https://www.python.org/)
- [Poetry](https://python-poetry.org/)
- [Node.js & npm](https://nodejs.org/en/)
- [Git](https://git-scm.com/)

It is recommended to install the following software to facilitate development:

- [VS Code](https://code.visualstudio.com/)

Each component may additionally have its own specific requirements.
Check the specific component readme for details.

## Deployment

This repo contains the required files to deploy _#vss365 today_ on a web server.

### First-time deployment

1. You will need the following software installed on your server:

   - A working [Docker and docker-compose](https://www.docker.com/) runtime
   - [Caddy](https://caddyserver.com/), _not_ running as a container or
   inside the _#vss365 today_  container stack.

1. Ensure you are following this structure when downloading all component sources download and creating any required folders:

   ```
   /var/www/
      vss365today/
         api/
         backup/
         db/
         finder/
         secrets/
         server/
         static/
         web/
   ```

1. Place all secret keys for each component in the `vss365today/secrets` folder.
The `vss365today/db` folder will be used to persist all database files and data.

1. Add the database username and password to the `vss365today/server/.env`
file for use by the database backup process.

1. Run `./build-containers.sh` to create a fresh build of all component
containers.

1. Run `./update-caddy.sh` to place the `Caddyfile` file in the proper
location on the server.

1. Run `./enable-caddy-logs.sh` to correct a permissions error so Caddy can write log files.

1. Start the Caddy server using `systemctl enable caddy && systemctl start caddy`.

1. Run `docker-compose up -d` to start the entire stack.

### Component update deployment

1. Download the latest source for each updated component.

1. Run `./build-containers.sh` to create a fresh build of all
component containers, or manually rebuild just the containers needed.

1. Run `docker-compose down && docker-compose up -d` to restart the entire stack.
TODO Does this need to change?

1. You will want to occasionally run `docker system prune -f` to remove all old container images.

### Server configuration update deployment

1. Make all required changes in the `Caddyfile.template` file.

1. Run `./update-domain.sh <your-domain.com>` to update the Caddyfile with your domain name.

1. Run `./update-caddy.sh` to place the generated `Caddyfile` file
in the proper location on the server.

1. Run `systemctl reload caddy` to make the changes take effect.

## Creation

2019-2021 Caleb Ely

[MIT](LICENSE)
