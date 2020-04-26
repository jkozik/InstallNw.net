```
# InstallNw.net
Install NapervilleWeather.net

To install the NapervilleWeather.net website, do the following steps
$ git clone https://github.com/jkozik/InstallNw.net
$ cd InstallNw.net
$ git clone https://github.com/ktrue/CU-HWS # pull in K True's version of weather34

$ vi settings1.php # Already setup, but need to add password and any new API keys
$ mkdir mount   # direct the Cumulus software to write realtime.txt to this directory.  Cronjob one a minute

$ docker build -t jkozik/nw.net .
$ docker run -dit --name nw.net-app -p 8080:80 -v mount:/var/www/html/mount jkozik/nw.net
$ docker exec -it nw.net-app /bin/bash # to get a bash prompt into the container

# to Rebuild, first stop and rm container
$ docker stop nw.net-app
$ docker rm   nw.net-app
```
