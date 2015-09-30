# Cloud Deployment

## Material for this Guide
This tutorial assumes a trivial python application, which you may fork from [https://github.com/amfleming/python-flask-bootstrap](https://github.com/amfleming/python-flask-bootstrap)

## Amazon ECS Vocabulary

* *Cluster* - A set of ECS Instances
* *ECS Instance* - An *EC2* instance running the *ECS* agent.  A single *ECS Instance* can run any number of *Services*.
* *Service* - A collection of related containers running together on an *ECS Instance*.  *Services* are defined by their *Task Definition* and run on an *Instance*
* *Task Definition* - A defines a service as a set of images and their linkages.  Note that a *Task Definition* in AWS an idential concept (and very similar syntax) to a `docker-compose.yml`
* *Container* - a Docker container
* *ECS Container Agent* - An agent running on an *ECS Instance* whose purpose is to communicate AWS and the Docker daemon running on the *instante*.  This is actually a container itself (!) and open source:  [[code](https://github.com/aws/amazon-ecs-agent)]



# 1. Create an empty ECS Cluster
What follows below is covered in much more detail in the [The Amazon EC2 Guide](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/get-set-up-for-amazon-ecs.html)

### Setup a Key Pair
Without one you will not be able to actually log in to new instances.  Go to _EC2_ -> _Key Pairs_ -> _Create_.  A `.pem` file will be downloaded to your machine. 

To make it easy to ssh into EC2 instances, do the following: 
```
# Keep the key file in your .ssh folder
cp ~/Downloads/MyKeyPair.pem ~/.ssh/

# SSH is very strict!  It will not look at the key file 
# unless you lock it down to only be readable by you
chmod 400 -rw ~/.ssh/MyKeyPair.pem

# Tell ssh to try this key-pair out when connecting to servers
ssh-add ~/.ssh/MyKeyPair.pem
```

### Setup a VPC
* _Setup a new VPC_ using the VPC Wizard.  Accept the defaults
* _Add a Firewall_ using the _Security Groups_ feature in the VPC.  You need SSH and HTTP.  
* _Lock down SSH to your IP Address!_


### Setup a User
Identity & Access Management (IAM) -> New User -> Attach Policy -> `PowerUserAccess`



# 2. Build and Push to DockerHub
You application should have a `Dockerfile` in its root folder which builds a self-contained image of your application.  In order for this image to run on AWS, you must push it to docker-hub. 

```
$ docker build .
$ docker tag <image_id> amfleming/python-flask-bootstrap
$ docker push amfleming/python-flask-bootstrap
```

## Troubleshooting
* You must have a DockerHub account
* You may need to docker login
* See the [tag, push and pull](https://docs.docker.com/mac/started/) section of the Docker Tutorial


# 3. Create a new ECS Task Definition

Run the [ECS First-run wizard](https://console.aws.amazon.com/ecs/home?region=us-east-1#/firstRun) tool, choosing 'custom'.  In addition to creating the new ECS cluster, the wizard will also create a new EC2 instance for you along with an auto-scaling policy.  (If you did not use the wizard, you would need to manually launch EC2 Instances configured with the *ECS Agent*) 

## Create the Task Definition
Add a single *Container Definition* with these settings: 

* *Container Name* can be anything you like
* *Image* should be a reference to your docker-hub image.  In this case it will be `amfleming/python-flask-bootstrap`
* *Memory* and *CPU Units* can be anything reasonable
* *Essential* should be checked
* *Port Mappings* should map port 80 in the container to 80 on the host.  If you do not map the port, there will be no errors, but you will not be able to access your python app!

## Schedule the Task as a Service
Choose *create a service* vs *Run Tasks Once*, to ensure your python web-app is continuously available

## Configure Cluster
You'll only need a single host to complete this tutorial, t2.micro is fine for instance type, and choose the Key-Pair that you previously created in step (1).  Select the User you created in step (1) as well.


# 4. Access your Running web App
Once the wizard completes the setup of your cluster, launches an ECS Instance, and deploys your app, you can simply access the url of the EC2 instance (e.g. `http://ec2-12-23-234-235.compute-1.amazonaws.com/`)