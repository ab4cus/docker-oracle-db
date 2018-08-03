#!/bin/bash
#set -ex
#docker rm $(docker ps -a -f status=exited -q)
# run docker
docker run --name db-oracle \
	--hostname=db.e4cash.local  \
	--network-alias=db \
	-m 1.5GB  \
	-p 1521:1521 \
	-p 1521:5500 \
	-e ORACLE_SID=e4cash \
	-e ORACLE_PDB=e4cashPDB \
	-e ORACLE_PWD=janusTestDB01 \
	-e ORACLE_CHARACTERSET=utf8 \
	-v /opt/oracle/oradata:/opt/oracle/oradata \
	-v /opt/oracle/scripts/startup:/opt/oracle/scripts/startup \
	-v /opt/oracle/scripts/setup:/opt/oracle/scripts/setup \
	-d e4cash/database-oracle-12.2.0.1.0

# Testing
#docker run --name db-oracle \
#	--hostname=db.e4cash.net  \
#	--network-alias=db \
#	-m 1.5GB  \
#	-p 1521:1521 \
#	-p 1521:5500 \
#	-e ORACLE_SID=e4cash \
#	-e ORACLE_PDB=e4cashPDB \
#	-e ORACLE_PWD=janusTestDB01 \
#	-e ORACLE_CHARACTERSET=utf8 \
#	-v /opt/oracle/oradata:/opt/oracle/oradata \
#	-v /opt/oracle/scripts/startup:/opt/oracle/scripts/startup \
#	-v /opt/oracle/scripts/setup:/opt/oracle/scripts/setup \
#	-d e4cash/database-oracle-12.2.0.1.0

sleep 5

docker ps -a

