
https://yeasy.gitbooks.io/docker_practice/container/attach_exec.html
https://github.com/docker/cli/issues/1134


#建立image, 只到 dev 的步驟
docker build -t koa-test1:v1 --target=dev  .

#建立image
docker build -t koa-test1:v1 .

#run image and use host volume with name( sometimes has problem use same name)
docker run -d -p 3001:3001 --name koa -v /Users/i_jhuhuchen/temp/koa:/home/node-app koa-test1:v1


#run image and use host volume
docker run -d -p 3001:3001 -v /Users/i_jhuhuchen/temp/koa:/home/node-app koa-test1:v1

# got to container
docker exec -it 69d1 bash


# list all container include stopped, pause
docker ps -a

# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)

# pm2 command
$ docker exec -it <container-id> pm2 monit	Monitoring CPU/Usage of each process
$ docker exec -it <container-id> pm2 list	Listing managed processes
$ docker exec -it <container-id> pm2 show	Get more information about a process
$ docker exec -it <container-id> pm2 reload all	0sec downtime reload all applications



