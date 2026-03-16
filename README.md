# Inception

***This project has been created as part of the 42 curriculum by mamichal***

## Description

This project aims to broaden systems administration knowledge and is heavily
focused on usage of Docker.  
It is designed to be run on the virtual machine.  
The containers are set-up using debian:bookworm as an underlying operating
system  
  
### Theory

* Virtual Machine vs Docker:  
A VM virtualizes the hardware to run an entire operating system,
while Docker virtualizes the operating system to run specific applications  
* Secrets vs Environment Variables:  
Environment variables are used for non-sensitive data that changes depending
on where the code is running  
Secrets are a specific type of environment variable that contain sensitive information.
If these are leaked, an attacker could gain unauthorized access to your data
or services  
* Docker Network vs Host Network:  
The primary difference between a Docker network and the Host network lies in isolation.
In a standard Docker network, the container lives in its own "bubble"
with a private IP.
In a host network, that bubble is popped,
and the container shares the computer's actual network identity  
* Docker Volumes vs Bind Mounts
Both are used to persist data so it doesn't vanish when a container stops.
The main difference between Docker Volumes and Bind Mounts boils down to
who manages the storage: Docker or you.

## Prerequisites

* git
* docker
* make
* hostsed

## Instructions

### Instalation and execution

**Make sure all the dependencies are installed**  

1. Cloning the repository  

 ```bash
 git clone https://github.com/Expl0-it/inception.git
 ```

2. Setting credentials in srcs/.env based on srcs/.env.template  

3. Running the project  

```make
make
```

To see the status of current containers run:

```make
make status
```

To access logs run:

```make
make logs
```

To down the containers run:

```make
make down
```

> [!WARNING]
> Below will delete all the container data

To cleanup space taken by the containers run either:

```make
make clean
```

or

```make
make fclean
```

## Resources

* [Docker documentation](https://docs.docker.com/)
* Disclaimer: No AI was used while developing the project
