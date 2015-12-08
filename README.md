Appium for crosswalk
=====

Crosswalk doesn't support standard **desiredCapabilities** from appium-chromedriver module.

appium-chromedriver uses object with name **chromeOptions** but crosswalk requires **xwalkOptions**

So I added this object to **desiredCapabilities** request

Run this docker container
-----

`docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb -p 4723:4723 hamsterksu/appium-xwalk`

How to install docker on windows
------

1. Install docker to Windows pc - https://www.docker.com/docker-toolbox 
2. Run "Kitematic (Alpha)" or "Docker Quickstart Terminal" as Administrator 
3. Docker tool will create virtual machine. this virtual machine will be available from VirtualBox control panel.
5. Close docker tool
6. Run VirtualBox as Administrator too.
7. Power off "default" machine. 
8. Download and install virtualbox extension pack with usb 2.0 supports - https://www.virtualbox.org/wiki/Downloads
9. close and run virtualbox as Administrator  again.
10. go to machine settings and enable usb 2.0 for it. 
11. add your phone to list of available usb ports.

Docker virtual pc
------

1. to get access to docker host you need to use ssh 
2. ip address of docker host you can find in "Docker Quickstart Terminal". usually it's 192.168.99.100
3. docker host user is docker
4. it uses private key instead of plain password. path to private key - %USERPROFILE%\.docker\machine\machines\default\id_rsa

How to connect by ssh
------

1. We will use Putty as ssh client
2. you should convert private key to putty ppk.
3. use puttyget for it: load key -> save private key. you will use this file to login
4. open putty and create session: use docker@ip as ip address - generally it's docker@192.168.99.100 - https://dl.dropboxusercontent.com/u/8604560/github-appium-xwalk/putty-step1.png
5. go to ssh->auth section and choose .ppk key file from step 3. - https://dl.dropboxusercontent.com/u/8604560/github-appium-xwalk/putty-step2.png
6. go to session and save it again. 
7. press open button. you will get access to docker host.

How to use docker host
------
1. Docker host provides access to docker command line.
2. Command reference - https://docs.docker.com/engine/reference/commandline/cli/ 
3. Glossary:
  1. Docker host - pc with installed docker management tool 
  2. Docker image - image of virtual machine - snapshot of os with preinstalled software. 
  3. Docker container - instance of virtual machine, which is created from image. **ATTENTION**: container doesn't save its state. so if you restart it you will get fresh instance. to save state you should use volumes.
  4. Docker volume - it's folder from docker host which can be attached to container. 
4. short list of commands:
  1. *docker run* - create docker container with specific params and start it. you will not have possibility to change start params. you have to recreate container. 
  2. *docker ps* - show started containers
  3. *docker ps* -a - show all existing containers
  4. *docker start <containerid>* - start container
  5. *docker stop <containerid>* - stop container
  6. *docker exec -i -t <containerid> bash* - connect to command line of selected container. type exit to close it. 
