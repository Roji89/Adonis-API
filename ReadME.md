npm init adonis-ts-app adonis-api

node ace serve --watch

image-mysql:
docker run --name adonis-mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:8

after preparing the Dockerfile:
docker build -t adonis-api .

docker run -d --name adonis -p 3333:3333 adonis-api