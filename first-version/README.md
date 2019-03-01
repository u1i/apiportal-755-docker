# API Portal 7.5.5 - Docker (Work in Progress)

## Objectives

* 'offline install' -> a fully configured API Portal once the container starts
* API Portal installer 100% unchanged 
* configurable MySQL connection
* configurable Redis connection (tbd)
* deployable on OpenShift
* optimized for operations 

## Steps to Build

### Run MySQL (or use hosted service)
`docker run --rm --name mysql-$RANDOM -p 3306:3306 -e MYSQL_ROOT_PASSWORD=axway -d mysql:5.7.24`

### Modify MySQL Connection settings

Change file `installer-wrapper.x` accordingly. Ultimately, this should be in the Dockerfile or environment variables.

### Copy API Portal Installer

Make sure you copy APIPortal_7.5.5_Install_RHEL7_linux-x86-64_BN126.tgz into the same directory

### Build Image

`docker build . -t portal-$RANDOM`

### Run Container Locally

`docker run -d -p 443:443 <image>`

## To Do

* non-privileged ports