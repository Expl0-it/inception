# Developer Documentation

<!--toc:start-->
- [Developer Documentation](#developer-documentation)
  - [1. Initial Environment Config](#1-initial-environment-config)
  - [2. Build and Launch](#2-build-and-launch)
  - [3. Manage Containers & Volumes](#3-manage-containers-and-volumes)
  - [4. Data Storage and Persistence](#4-data-storage-and-persistence)
<!--toc:end-->

## 1. Initial Environment Config

**System requirements:**  

- docker & docker-compose  
- make  
- hostsed  
  
**Configuration steps:**

- Initialize your credentials by creating a .env file,
using the provided .env.example as a template
- Upon the first execution of make, the hostsed tool should automatically
append the necessary redirect to your /etc/hosts file
- Verify that the following entry exists in /etc/hosts and add it manually
if it is missing:

```bash
127.0.0.1   localhost mamichal.42.fr
```

## 2. Build and Launch

The infrastructure is managed via the root `Makefile`:

- `make` : Set up data directories,
modifies /etc/hosts, builds images and starts containers.
- `make down` : Stops the containers.
- `make clean/fclean` : Stop containers and delete all the data (removes images,
networks, and **deletes all physical data volumes**).

## 3. Manage Containers and Volumes

- **List running services:** `make status / docker ps`
- **List all volumes:** `docker volume ls`
- **Access logs from all the services:** `make logs`
- **View service logs:** `docker logs <container_name>`
(`nginx`, `wordpress`, `mariadb`)
- **Access container shell:** `docker exec -it <container_name> bash`
- **Exit shell:** `exit`

## 4. Data Storage and Persistence

To prevent data loss when containers are destroyed,
the project uses **Docker Named Volumes**
mapped directly to the host's physical storage:

- **Database (MariaDB):**
    Mapped from `/var/lib/mysql` (container) to `/home/mamichal/data/mdb` (host).
- **Website Files (WordPress):**
    Mapped from `/var/www/html` (container) to `/home/mamichal/data/wp` (host).

**Persistence:** Data remains fully intact even if containers are stopped
or removed or if the system is shut down. It is only erased if the host directories
are manually deleted (by running `make clean / make fclean`).
