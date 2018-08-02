set -ex
# run docker
# oracle/database:12.2.0.1-ee
# docker run -t -i oracle-db-12.2.0.1
# docker run -d -it --name=oracleDB12 -p 1521:1521 -p 5500:5500 -e ORACLE_SID=ORCLCDB -e ORACLE_PID=ORCLPDB1 -e ORACLE_CHARACTERSET=AL32UTF8 -v /var/oracle:/opt/oracle/oradata oracle-db-12.2.0.1
#docker run --name=haproxy1.8-core -m 1.5GB --add-host=app.core.priv.e4-cash.net:10.132.148.63 -p 80:80 -p 443:443 -p 9990:9990 -d e4cash/proxy-haproxy-1.8:latest 

#docker run --name=oracle12-ee -m 1.5GB -p 1521:1521 -p 5500:5500 -v /opt/oracle/scripts:/opt/oracle/scripts/startup -v /opt/oracle/oradata:/opt/oracle/oradata oracle-db-12.2.0.1

docker run --name db-oracle12 \
-p 1521:1521 -p 1521:5500 \
-e ORACLE_SID=e4cash \
-e ORACLE_PDB=e4cashPDB \
-e ORACLE_PWD=janusTestDB01 \
-e ORACLE_CHARACTERSET=utf8 \
-v /opt/oracle/oradata:/opt/oracle/oradata \
-v /opt/oracle/scripts/startup:/opt/oracle/scripts/startup \
-v /opt/oracle/scripts/setup:/opt/oracle/scripts/setup \
database-oracle-12.2.0.1.0


docker ps -a
