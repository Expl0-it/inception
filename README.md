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
* Secrets vs Enviroment Variables:
Environment variables are used for non-sensitive data that changes depending
on where the code is running  
Secrets are a specific type of environment variable that contain sensitive information.
If these are leaked, an attacker could gain unauthorized access to your data
or services  

## Requirements

* git
* docker
* make
* hostsed

## Instructions

**Make sure all the dependencies are installed**  
To run the project simply clone the repo and run:

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
* Disclaimer: No AI was used developing the project
