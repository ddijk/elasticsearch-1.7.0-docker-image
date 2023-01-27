# Build image
docker build -f Dockerfile -t custom-ready-elasticsearch-1.7.0:1.0 .

docker run --name es -p 9200:9200 -p 9300:9300 custom-ready-elasticsearch:1.0


# run, do not exit
docker run -t -d --name myes -p 9200:9200 -p 9300:9300 custom-ready-elasticsearch:1.0

docker exec -it myes /bin/bash


