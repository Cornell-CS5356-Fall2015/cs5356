# Install a VirtualMachine, Docker-Machine and Docker

A VM allows you to run Linux on your mac

`docker-machine` creates and manages your virtual machines programmatically
`docker` is the client that will communicate with the docker server in the virtual machine created by `docker-machine`

## Install Brew
Brew is a general-purpose tool for installing software on the mac. Go to http://brew.sh/ and follow the instructions to install brew DO NOT USE SUDO FOR ANY PARTS OF THIS PROCESS - if you encounter permissioning problems,  you have a deeper problem with your computers configuration

## Install Brew Cask
Brew cask is an extension of brew that allows you to install larger applications (like VirtualBox) using brew
```
brew install caskroom/cask/brew-cask
```

## Install Brew Cask / Versions
The current version of VirtualBox is 5.0.2, and does not work correctly.  To install the slightly older version of brew you will need to run the following command, which expands the universe of software that brew can install:
```
brew tap caskroom/versions
```

## Install VirtualBox
```
brew cask install  virtualbox500101573
```

## Install Docker-Machine
```
brew install docker-machine
```

## Install Docker
```
brew install docker
```

## Create the VM
Now you should be in a position to actually stand up a virtual machine.  Do this using `docker-machine`.  You can give your virtual machine any name, I will call it here `my_machine`
```
docker-machine create --driver=virtualbox my_machine
```

If all goes well, you should be able to see your machine by running the command docker-machine ls and see something similar:
```
$ docker-machine ls
NAME            ACTIVE   DRIVER       STATE     URL
my_machine                virtualbox   Running   tcp://192.168.99.100:2376
```

## Tell The Docker Client About the Virtual Machine
The docker client, which you will use to create and manage docker containers and images needs to know how to communicate with the docker server / host.  docker-machine can help you with this - if you run $ docker-machine env my_machine you will see a print-out of special environment variable you need to set so that docker can communicate with your new VM:
```
$ docker-machine env my_machine
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/afleming/.docker/machine/machines/my_machine"
export DOCKER_MACHINE_NAME="my_machine"
# Run this command to configure your shell:
# eval "$(docker-machine env my_machine)"
```

Following the instructions at the bottom, doing the following will configure your current terminal / session correctly:
```
eval "$(docker-machine env my_machine)"
```

## Create and Run your first Docker Container
You can create a running container from an image by using the following command:
```
docker run <image_name> <command>
```

Docker will attempt to pull the image from Docker Hub if you do not have the image locally.  You can see your local images by running docker images

So doing the following should download the busybox image from Docker Hub and execute the echo command:
```
docker run busybox echo "it works"
```

## Running a container interactively
It is more interesting to run a container interactively - you can easily do this by running a command like /bin/sh which allows you to explore and manipulate the running container:
```
docker run -it busybox /bin/sh
```

## Opening a Shell in a running container
If a container is already running a command and you would like to explore it (we haven't talked about how to do this yet) you use the exec command instead of the run command.  exec executes a command in a running container, run creates a new container from an image.
```
docker exec -it <container_id> /bin/sh
```

## Building your own image
There are three basic steps to creating your own image
Decide which base image to build FROM
Manipulate the image by ADDing files and installing software
Tell Docker which CMD should be run when a container based on the images is started

To work through this process, we will build an image that runs an nginx web server and serves a simple HTML file.  Lets start by making a clean directory to work in:
```
mkdir /tmp/clean_dir
cd /tmp/clean_dir
```

## Create a Dockerfile
The Dockerfile tells docker how to build an image.  After searching dockerhub we feel like the nginx base image is most appropriate to start from.   Let's create the new Dockerfile and add only two lines to it:
```
$ touch Dockerfile
$ echo "FROM nginx:latest" >> Dockerfile
$ echo "ADD ./my_index.html /usr/share/nginx/html/index.html" >> Dockerfile
```

## Build the Image
If we try to build the image, docker will first download the nginx base image (slow the first time, cached in the future) and run the Dockerfile commands against it.  It will fail because we have not created the index.html file that we wanted to copy in to the container:
```
$ docker build .
Sending build context to Docker daemon 2.048 kB
Step 0 : FROM nginx:latest
---> a486da044a3f
Step 1 : ADD ./index.html /usr/share/nginx/html
index.html: no such file or directory
```

To fix that lets make a simple index.html file:
```
$ echo "Hello WORLD" >> my_index.html
```

And try to build again:
```
$ docker build .
Sending build context to Docker daemon 3.072 kB
Step 0 : FROM nginx:latest
---> a486da044a3f
Step 1 : ADD ./index.html /usr/share/nginx/html/index.html
---> 7b9268dd5eb0
Removing intermediate container 15ef654d72e4
Successfully built 7b9268dd5eb0
```

## Running your image
A successful docker build adds the newly built image to the list of all images available on your machine.  Since we did not tag the image we built, we have to use docker images to find its id so we can run it:
```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED              VIRTUAL SIZE
<none>              <none>              7b9268dd5eb0        About a minute ago   132.9 MB
```

And we can run an instance of the image  it simply by typing `docker run <image_id>`, so in this case it would be `docker run 7b9268dd5eb0`.

## Connecting to the running server
So at last we've built and run a server, but how do we know if it works?  docker-machine comes to the rescue again - `docker-machine ls` or `docker-machine ip my_machine` will show you the ip of your running vm (or you may remember it from earlier - in this case it is 192.168.99.100).

If you open your favourite browser and type in http://192.168.99.100 you get..... nothing.  This is because even though the container exposes port 80, the virtual machine does not know that port 80 should be open so that your browser can communicate with it.  This is easy to fix - just add a -p option to the docker run command, which takes as input the container port and the virtual-machine ports to connect.  Doing the following and reloading  your browsers page should show a log message and load your page!
```
$ docker run -p 80:80 7b9268dd5eb0
192.168.99.1 - - [03/Sep/2015:15:42:17 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36" "-"
```



