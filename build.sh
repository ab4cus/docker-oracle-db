set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=e4cash
# image name
IMAGE=database
# version wildfly
ORACLE_VERSION=12.2.0.1.0

docker system prune --all -f

docker build --tag=$IMAGE-oracle-$ORACLE_VERSION -t $USERNAME/$IMAGE-oracle-$ORACLE_VERSION:latest -m 3g . 

