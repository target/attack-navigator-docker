# attack-navigator-docker
A simple Docker container that serves the MITRE ATT&amp;CK Navigator web app

[![Target’s CFC-Open-Source Slack](https://cfc-slack-inv.herokuapp.com/badge.svg?colorA=155799&colorB=159953)](https://cfc-slack-inv.herokuapp.com/)

## Prerequisites

You'll need the following installed on your system:

* Docker
* Node.js
* Angular-CLI

My development environment is a Mac, so I installed the Docker for Mac package, and then used homebrew to install the rest:

    brew install node angular-cli

## Building

First, check out the code:

    git clone --recurse-submodules https://github.com/target/attack-navigator-docker.git

Now just change directory into the repo and run `make`:

    cd attack-navigator-docker
    make

## Running the Container

You have two options.  First, you can change directory into the repo and just run `make run` to start up the container with the most common options.  Then just point your browser to [http://localhost:80](http://localhost:80) to access the Navigator.

Alternatively, if you're Docker friendly, you can run the container manually:

    docker run -it -p 80:80 --name attacknav davidjbianco/attacknav:latest

As written, this is the same command the the `Makefile` uses to start the container, but this way you have the option to specify the exact Docker options you want.  

## Updating the container

You may wish to rebuild the container from time-to-time, chiefly to get new versions of the ATT&CK Navigator code.  This is contained in a git submodule, so to pull the latest copy and merge it into your repo, do the following:

    cd attack-navigator-docker/attack-navigator
    git fetch
    git merge

At this point, you've updated your local copy of the submodule.  You may wish to push the new module back to the `attack-navigator-docker` repo so everyone will also have the newest copy.  Simply commit and push the top level repo as you normally would.
