make clean
make
docker build -t "fuzzcoin" .
docker run --rm -i "fuzzcoin"
