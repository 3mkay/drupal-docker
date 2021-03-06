# Drupal Docker Setup

## This is:
A collection of docker build scripts that can be build specificly with Drupal in mind.

## This is not:
A collection of containers that follows the guidelines and best practice stated at docker.com. The reason for this is, that I want a developer environment that is easy to use, not correct to use. So I try to make Docker stay as much in the background as posible. So if you are wondering why I suggest that you run one docker instance at the time, for all websites, and not a container per web site, this is why.

## How it works

 1. You edit the ```settings.sh```
 1. You run ```build.sh``` (if you feel the need to build the containers yourself. If you skip this, pre-built containers will be downloaded instead)
 1. You run either ```php53.sh```, ```php54.sh``` or ```php55.sh```
 1. You websites are now available at http://localhost/[site-folder]
 1. To stop your containers, run ```stop.sh```
 1. If you want to clean up unneeded images (to save space) run ```cleanup.sh```

## In detail

Here is some more in-depth information on how it is working and how it is meant to be used.

### Requirements
 - Docker version >= 1.5 (Earlier versions have problems with port allocation. Ubuntu users are advised to use the [Docker-maintained Package Installation](https://docs.docker.com/installation/ubuntulinux/). )

### The configuration

The environment dependent settings, like where your web root is, what user the web server should be running as, etc., is set in the ```settings.sh```.

You would probably like to edit the files directly from your host, to get as much speed as possible, when using tools like git, drush and CodeSniffer. So having the files, not contained, and shared with the docker instances, is the best way to do it. To keep your permissions on the files, even if they are created/altered by the docker instance, you have to use the same username for running the contained web server, as the username that needs access to the files on the host.

### The web server container

There are three different web servers, each slightly different configured. One configured to use PHP 5.3, one with PHP 5.4 and one PHP 5.5. Choose the one that comes closest to your production environment.

Configuration they all have in common is:

- Apache2. 2.2 for ```php53.sh``` and ```php54.sh``` and 2.4 for ```php55.sh```. This is the most common set ups I see    out there.
- PHP modules/extensions:
  - mysql
  - gd
  - curl
  - pear
  - xdebug
  - intl
  - sqlite
  - apc
- git
- mysql-client
- msmtp
- curl

### The database server

The database server is using MariaDB. Why? Because is a lot faster that MySQL and is perfectly compatible with Drupal.

You can access the from Drupal by using:

- Hostname: db
- Username: admin
- Password: root (this can be changed in the ```settings.sh```)

The folder that contains the database tables can be set in the ```settings.sh``` too. You don't wan't your database to be gone, when you shut down the instance, do you? ;-)

I recommend that you alter your hostfile , so that 127.0.0.1 resolves to db. In that way, you can use drush in on your host system.

### The mail server

All mails sent from the web servers will caught by a docker container, running MailCatcher. You can see all mails at http://localhost:1080.

You won't be able to send mails to the "real" world through Drupal. They will all end up here.

### The Solr server

The solr instance can be reached using:

- Host: solr
- Port: 8983
- Path: /solr

No authentication needed.

The solr configuration is specific for the Drupal module ```search_api_solr```, so it won't do much good for pretty much any other needs.

The search indexes are NOT kept post container shutdown. Every time you restart your containers, you will have to rebuild the indexes.
