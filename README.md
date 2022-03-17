# kafka
Docker Image for Kafka


# build image
```
docker built . -t kafka
```

# run the container
```
docker run --rm -d -p 9092:9092 kafka
```

# get kafka topic list
```
cd ~/Downloads/kafka
./kafka-topics.sh --bootstrap-server localhost:9092 --list
```
