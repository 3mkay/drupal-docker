# Drupal Docker Setup

## This is:
A collection of docker build scripts that can be build specificly with Drupal in mind.

## This is not:
A collection of containers that follows the guidelines and best practice stated at docker.com. The reason for this is, that I want a developer environment that is easy to use, not correct to use. So I try to make Docker stay as much in the background as posible.

## How it works

1: You edit the ```settings.sh```
1: You run ```build.sh```
1: You run either ```php53.sh```, ```php54.sh``` or ```php55.sh```
1: You websites are now available at http://localhost
