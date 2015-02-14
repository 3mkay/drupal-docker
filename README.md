# Drupal Docker Setup

## This is:
A collection of docker build scripts that can be build specificly with Drupal in mind.

## This is not:
A collection of containers that follows the guidelines and best practice stated at docker.com. The reason for this is, that I want a developer environment that is easy to use, not correct to use. So I try to make Docker stay as much in the background as posible. So if you are wondering why I surgest that you run one docker instance at the time, for all websites, and not a container per web site, this is why.

## How it works

 1. You edit the ```settings.sh```
 1. You run ```build.sh```
 1. You run either ```php53.sh```, ```php54.sh``` or ```php55.sh```
 1. You websites are now available at http://localhost

## In details

Here are some more in depth information on how it is working and how it is meant to be used.

### The configuration

The environment dependant settings, like where your web root is, what user the web server should be running as, e.t.c, is set in the ```settings.sh```.

You would probably like to edit the files directly from your host, to get as much speed as possible, when using tools like git, drush and CodeSniffer. So having the files, not contained, and shared with the docker instances, is the best way to do it. To keep your permissions on the files, even if they are created/altered by the docker instance, you have to use the same username for running the contained web server, as the username that needs access to the files on the host.

### The web server container

### The database server

### The mail server

### The Solr server
