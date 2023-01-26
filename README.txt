docker build -f Dockerfile.debian -t custom-es:1.0 .

docker run --name myes -p 9200:9200 -p 9300:9300 custom-es:1.0


# run, do not exit
docker run -t -d custom-es:1.0

docker exec -it ecstatic_franklin /bin/bash