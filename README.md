# InstallNw.net
Install NapervilleWeather.net

To install the NapervilleWeather.net website, do the following steps

First, setup a data storage container that wraps the realtime weather data files (eg realtime.txt) into something that can be shared across multiple containers.  So run below, but only once.  If you are running multiple websites from the same weather data, this container is shared.  So optionally run below:
```
$ docker run -dit --name wjr-data -v /mount/wjr:/var/www/html/mount php:7.2-apache
$ docker exec -it wjr-data /bin/bash     # verify that you can find realtime.txt in the directory si
```
Next clone the repository, build and run the container:
```
$ git clone https://github.com/jkozik/InstallNw.net
$ cd InstallNw.net
$ vi settings1.php # Already setup, but need to add password and any new API keys
$ docker build -t jkozik/nw.net .
$ docker run -dit --name nw.net-app -p 8080:80 --volumes-from wjr-data jkozik/nw.net
$ docker exec -it nw.net-app /bin/bash # For troubleshooting, to get a bash prompt into the container

# to Rebuild, first stop and rm container
$ docker stop nw.net-app && docker rm nw.net-app
```
