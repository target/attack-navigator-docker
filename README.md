# attack-navigator-docker
A simple Docker container that serves the MITRE ATT&amp;CK Navigator web app

[![Target’s CFC-Open-Source Slack](https://cfc-slack-inv.herokuapp.com/badge.svg?colorA=155799&colorB=159953)](https://cfc-slack-inv.herokuapp.com/)

## Prerequisites

You really just need Docker and an Internet connection.

## Building

First, check out the code:

    git clone --recurse-submodules https://github.com/target/attack-navigator-docker.git

Now just change directory into the repo and run `make`:

    cd attack-navigator-docker
    make

### The Build Process Explained

By default, the `Makefile` will pull down docker containers for `nginx` (which is the base of the final image we build) and `node`, which is used during the build process.  It will also update the MITRE ATT&CK Navigator app's repo, which we include here as a submodule.  Thus, whenever you build, you'll get the latest published version of the app.

Once the images are staged and the app code updated, we run an ephemeral copy of the `node` container, in which we mount and build the app.  The container is automatically deleted at the end of the run, but it leaves the compiled app in `attack-navigator/nav-app/dist`.  

Next, we call `docker build` with a very simple `Dockerfile` that just creates an `nginx` container with the app code copied into the web content directory.  That's really all that's necessary to get this app running in Docker.

**NOTE:** The copy you just built with the makefile will be tagged as ":dev".  You can manually tag it with something else if you like (e.g., ":latest").

## Running the Container

You have two options.  First, you can change directory into the repo and just run `make run` to start up the container with the most common options.  Then just point your browser to [http://localhost:80](http://localhost:80) to access the Navigator.  This will run the image version tagged as ":dev", which is typically the last version you built.

Alternatively, if you're Docker friendly, you can run the container manually:

    docker run -it -p 80:80 --name attacknav davidjbianco/attacknav:dev

As written, this is the same command the the `Makefile` uses to start the container, but this way you have the option to specify the exact Docker options you want.  
