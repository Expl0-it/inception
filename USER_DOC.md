# User Documentation

## 1. Services

The infrastructure provided is an isolated (dockerized) web environment
and consists of:  

* **NGINX (The Web Server):**
The website's entrance.
It safely handles all incoming traffic from the internet using an
encrypted connection (HTTPS) and sends users necessary files.  

* **WordPress (The Website):**
It handles the looks and functionalities of the website,
lets you create posts and manage users.
It consists of the website interface and administration panel (wp-admin)  

* **MariaDB (The Database):**
It securely stores data needed by WordPress

## 2. Starting and Stopping the Project

The infrastructure is managed via the root `Makefile`:

* `make` : Set up data directories,
modifies /etc/hosts, builds images and starts containers.
* `make down` : Stops the containers.
* `make clean/fclean` : Stop containers and delete all the data (removes images,
networks, and **deletes all physical data volumes**).

## 3. Accessing the Website and Admin Panel

Once the project is running, you can access
your website through any web browser.

* **Public Website:** Navigate to `https://mamichal.42.fr`
* **Administration Panel:** Navigate to `https://mamichal.42.fr/wp-admin`
    *(Use the previously added usernames and passwords to log in).*

**Note on Security Warning:** Because this project uses a self-signed
security certificate (for local development),
your browser might show a "Your connection is not private" warning.
You can safely click "Advanced" and proceed to the website.

## 4. Locating and Managing Credentials

All sensitive information (usernames, passwords, database names)
is kept in a single, central location to make management easy and secure.

* **The `.env` file:** You can find and edit all credentials in the
`.env` file located in the `srcs/` directory.
`.env` is constructed using `.env.template` file
* **How to manage:** If you want to change the
administrator password or database name, you must edit the `.env`
file before starting the project with `make`.

## 5. Checking if Services are Running Correctly

**Check Container Status:**
Run the following command to see a list of all active services:

```bash
make status
```

You should see three containers (nginx, wordpress, mariadb)
listed with a status of "Up".
